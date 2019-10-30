import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/AnnouncementModel.dart';
import 'package:flutter/material.dart';

class AnnouncementListItem extends StatelessWidget {
  final AnnouncementModel announcement;

  const AnnouncementListItem({this.announcement});
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
            announcement.postTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 6),
          Text(
            announcement.postContent,
            style: TextStyle(fontSize: 14),
          ),
          Container(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              DateTime.now().toIso8601String(),
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
