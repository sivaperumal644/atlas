import 'package:atlas/components/announcement_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SectionHeader(
              titleText: 'Announcements',
              subTitleText: 'Updates will be posted here',
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: AnnouncementListItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
