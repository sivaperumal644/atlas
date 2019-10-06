import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class AnnouncementListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: GREY_COLOR.withOpacity(0.2),
          width: 2,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Title of post',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 6),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
            style: TextStyle(fontSize: 14),
          ),
          Container(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '04:30 PM - 27/09/2019',
              style: TextStyle(
                color: GREY_COLOR,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
