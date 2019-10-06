import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  const SecondaryButton({
    this.text = '',
    this.onPressed,
    this.color = RED_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
      onPressed: onPressed,
      borderSide: BorderSide(color: color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontFamily: 'roboto',
            ),
          ),
        ],
      ),
    );
  }
}
