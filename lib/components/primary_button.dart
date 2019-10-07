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
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 28),
      color: ORANGE_COLOR,
      onPressed: onPressed,
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Text(
          '$text',
          style: TextStyle(
            color: WHITE_COLOR,
            fontSize: 16,
            fontFamily: 'roboto',
          ),
        ),
      ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
