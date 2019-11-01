import 'package:atlas/app_state.dart';
import 'package:atlas/models/UserModel.dart';
import 'package:atlas/screens/on_boarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerScreen extends StatefulWidget {
  final scanToken;

  const QRCodeScannerScreen({Key key, this.scanToken = 'NA'}) : super(key: key);
  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Scan QR Code'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                width: 400,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Text('Result of scan: $qrText')
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        if (qrText == '12345') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnBoardingScreen()));
          dispose();
        } else {
          checkIfQrisLogin(qrText, context);
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void checkIfQrisLogin(String qrText, context) async {
    if(qrText.contains('USER')) {
      print('The QR Text $qrText contains USER');
      var userReference;
      showDialog(context: context, barrierDismissible: false, builder: (context) {
        return AlertDialog(title: Text('Logging you in..'),
        content: Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(16), child: Container(
          height: 20,
            width: 50,

            child: LinearProgressIndicator()),),);
      });
      try {
        userReference = await Firestore.instance.collection('users').document(qrText).get();
      } catch (e) {
        print(e);
        Navigator.pop(context);
      }
      var newUser = UserModel(
        redeemedTokens: [],
        registeredEvents: [],
        id: userReference['id'],
        name: userReference['name'],
        registerno: userReference['registerno'],
        phone: userReference['phone'],
        institute: userReference['institute'],
        degree: userReference['degree'],
        email: userReference['email']
      );
      final appState = Provider.of<AppState>(context);
      appState.setUser(newUser);
      Navigator.of(context).pop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()));
      dispose();
    }
  }
}
