import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SecondaryButton({
    this.text = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
      onPressed: onPressed,
      borderSide: BorderSide(color: RED_COLOR),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: RED_COLOR,
              fontSize: 14,
              fontFamily: 'roboto',
            ),
          ),
        ],
      ),
    );
  }
}
