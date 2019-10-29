import 'package:atlas/components/dialog_style.dart';
import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/admin_login_screen.dart';
import 'package:atlas/screens/login_qr_scan_screen.dart';
import 'package:atlas/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String signInToken = '';
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: BLACK_COLOR,
      body: Column(
        children: <Widget>[
          Container(height: 80),
          Center(
            child: Image.asset(
              'assets/images/app_logo.png',
              width: 120,
              height: 120,
            ),
          ),
          Container(height: 20),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminLoginScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                'Switch to Admin login',
                style: TextStyle(
                  color: WHITE_COLOR,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 35, 24, 8),
            height: 1.5,
            color: GREY_COLOR.withOpacity(0.5),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Just a step away',
                    style: TextStyle(
                      color: WHITE_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QRCodeScannerScreen();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.only(top: 5, bottom: 16),
                    child: Text(
                      'Scan the QR Code Token or type it  ',
                      style: TextStyle(
                        color: WHITE_COLOR,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                scanComponent(),
                Center(
                  child: Text(
                    'OR TYPE',
                    style: TextStyle(
                      color: WHITE_COLOR.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(24),
                  child: TextField(
                    style: TextStyle(color: WHITE_COLOR, fontSize: 24),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WHITE_COLOR),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WHITE_COLOR),
                      ),
                      hintText: 'Sign In Token',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: WHITE_COLOR.withOpacity(0.6),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        signInToken = val;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SecondaryButton(
                      text: 'CONTINUE',
                      onPressed: () {
                        if (signInToken == '12345') {
                          setState(() {
                            appState.setIsAdmin(false);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnBoardingScreen(),
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return DialogStyle(
                                  title: 'Invalid token.',
                                  contentParaOne:
                                      'The token you entered is invalid. Please check your sign in token with volunteers.',
                                  contentParaTwo: '',
                                  buttonText: 'Got it',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        }
                      },
                      color: WHITE_COLOR.withOpacity(0.6),
                    ),
                    Container(width: 24)
                  ],
                ),
                Container(height: 42)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget scanComponent() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QRCodeScannerScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: GREY_COLOR, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.camera_alt),
            Container(width: 12),
            Text(
              'SCAN QR CODE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
