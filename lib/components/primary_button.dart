import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({
    this.text,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
      color: ORANGE_COLOR,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: WHITE_COLOR,
              fontSize: 14,
              fontFamily: 'roboto',
            ),
          ),
        ],
      ),
    );
  }
}
