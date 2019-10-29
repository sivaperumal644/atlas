import 'package:atlas/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerScreen extends StatefulWidget {
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
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
