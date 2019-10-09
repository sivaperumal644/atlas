import 'package:atlas/components/event_list_item.dart';
import 'package:atlas/components/search_bar.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
            child: SectionHeader(
              titleText: 'Events',
              subTitleText: 'List of events at SNS Allora 2020',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, left: 24, right: 24),
            child: SearchBar(),
          ),
          Container(height: 32),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return EventListItem();
            },
          )
        ],
      ),
    );
  }
}
