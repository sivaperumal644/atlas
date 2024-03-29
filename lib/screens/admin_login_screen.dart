import 'package:atlas/components/dialog_style.dart';
import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/navigate_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import 'login_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  String username = '';
  String password = '';
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
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                'Switch to participant login',
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.only(top: 5, bottom: 16),
                  child: Text(
                    'Enter your sign-in credentials to continue',
                    style: TextStyle(
                      color: WHITE_COLOR,
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
                      hintText: 'username',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: WHITE_COLOR.withOpacity(0.6),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        username = val;
                      });
                    },
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
                      hintText: 'password',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: WHITE_COLOR.withOpacity(0.6),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                ),
                Container(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SecondaryButton(
                      text: 'CONTINUE',
                      onPressed: () {
                        if (username == 'admin' && password == 'admin') {
                          setState(() {
                            appState.setIsAdmin(true);
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigateScreen(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return DialogStyle(
                                title: 'Invalid username/password.',
                                contentParaOne:
                                    'The username or password you entered is invalid. Please check your login credentials.',
                                contentParaTwo: '',
                                buttonText: 'Got it',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
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
