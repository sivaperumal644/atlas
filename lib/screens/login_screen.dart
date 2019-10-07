import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLACK_COLOR,
      body: Column(
        children: <Widget>[
          Container(height: 48),
          Center(
            child: Image.asset(
              'assets/images/app_logo.png',
              width: 120,
              height: 120,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 60, 24, 16),
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
                Container(
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
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SecondaryButton(
                      text: 'CONTINUE',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoardingScreen(),
                          ),
                        );
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
    return Container(
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
    );
  }
}
