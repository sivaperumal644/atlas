import 'package:atlas/components/dark_mode_item.dart';
import 'package:atlas/components/more_options_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            child: SectionHeader(
              titleText: 'More',
              subTitleText: 'Other features of this app',
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: MoreOptionsListItem(
              title: 'Venue Map',
              subTitle: 'View a map of this place',
              icon: Icons.map,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: MoreOptionsListItem(
              title: 'Get help',
              subTitle: 'View volunteers’ contacts',
              icon: Icons.person,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: DarkModeItem(),
          ),
        ],
      ),
    );
  }
}
