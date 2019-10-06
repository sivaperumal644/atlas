import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class DialogStyle extends StatelessWidget {
  final String title;
  final String contentParaOne;
  final String contentParaTwo;
  final String buttonText;
  final Function onPressed;
  final bool isRed;

  const DialogStyle({
    this.title = '',
    this.contentParaOne = '',
    this.contentParaTwo = '',
    this.buttonText,
    this.onPressed,
    this.isRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: isRed ? RED_COLOR : GREEN_COLOR,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            contentParaOne,
            textAlign: TextAlign.center,
          ),
          Container(height: 12),
          Text(
            contentParaTwo,
            textAlign: TextAlign.center,
          ),
          Container(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SecondaryButton(
                text: buttonText,
                onPressed: onPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
