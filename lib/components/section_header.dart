import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String titleText;
  final String subTitleText;

  const SectionHeader({this.titleText = '', this.subTitleText = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: RED_COLOR,
            fontSize: 36,
          ),
        ),
        Text(
          subTitleText,
          style: TextStyle(
            fontSize: 16,
            color: GREY_COLOR,
          ),
        ),
      ],
    );
  }
}
