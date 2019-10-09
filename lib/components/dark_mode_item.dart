import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class DarkModeItem extends StatefulWidget {
  @override
  _DarkModeItemState createState() => _DarkModeItemState();
}

class _DarkModeItemState extends State<DarkModeItem> {
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: WHITE_COLOR,
        border: Border.all(color: BLUE_COLOR)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.brightness_3,
            color: BLUE_COLOR,
            size: 36,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dark theme',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: BLUE_COLOR),
              ),
              Text(
                'Change app theme',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Switch(
            value: isEnabled,
            onChanged: (val) {
              setState(() {
                isEnabled = val;
              });
            },
          )
        ],
      ),
    );
  }
}
