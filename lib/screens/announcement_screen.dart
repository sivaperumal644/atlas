import 'package:atlas/components/announcement_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/add_new_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      floatingActionButton: appState.getIsAdmin
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: RED_COLOR,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewPost(),
                  ),
                );
              },
            )
          : null,
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
              itemCount: 2,
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
