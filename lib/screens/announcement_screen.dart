import 'package:atlas/components/announcement_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/AnnouncementModel.dart';
import 'package:atlas/screens/add_new_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final announcements = appState.getAnnouncements;
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
      body: ListView(
          children:   [
            Container(
              margin: EdgeInsets.only(top: 48, left: 24, right: 24),
              child: SectionHeader(
                titleText: 'Announcements',
                subTitleText: 'Updates will be posted here',
              ),
            ),
            Container(height: 32),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('posts').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting: return new Text('Loading...');
                  default:
                    return Column(
                        children: snapshot.data.documents.map((document) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(24, 8, 24, 8),
                            child: AnnouncementListItem(
                              announcement: AnnouncementModel(
                                postContent: document['postContent'],
                                postTitle: document['postTitle']
                              ),
                            ),
                          );
                        }).toList()
                    );
                }
              },
            ),]
      ),
    );
  }

  buildAnnouncementPosts(announcements) {
    List<AnnouncementListItem> components = [];
    announcements.forEach((announcement) {
      components.add(AnnouncementListItem(
        announcement: announcement,
      ));
    });
    return components;
  }
}
