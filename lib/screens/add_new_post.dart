import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/AnnouncementModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class AddNewPost extends StatefulWidget {
  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  String postTitle = '';
  String postContent = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appBar(),
          Container(height: 24),
          editFields('Post title', (val) {
            setState(() {
              postTitle = val;
            });
          }),
          editFields('Post content', (val) {
            setState(() {
              postContent = val;
            });
          }, bottom: 120.0)
        ],
      ),
    );
  }

  Widget editFields(hintText, onChanged, {bottom = 10.0}) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, bottom),
      decoration: BoxDecoration(
        border: Border.all(color: GREY_COLOR, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
        onChanged: onChanged,
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: GREY_COLOR, blurRadius: 5),
        ],
        color: WHITE_COLOR,
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: GREY_COLOR,
                ),
              ),
              Container(width: 32),
              Text(
                'Add new post',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: RED_COLOR,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              final appState = Provider.of<AppState>(context);
              appState.setAnnouncement(AnnouncementModel(
                  postContent: postContent, postTitle: postTitle));
              Navigator.pop(context);
            },
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
