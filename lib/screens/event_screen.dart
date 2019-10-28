import 'package:atlas/components/admin_event_list_item.dart';
import 'package:atlas/components/event_list_item.dart';
import 'package:atlas/components/search_bar.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/add_new_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class EventScreen extends StatelessWidget {
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
                    builder: (context) => AddNewEvent(),
                  ),
                );
              },
            )
          : null,
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
            itemCount: 2,
            itemBuilder: (context, index) {
              return appState.getIsAdmin
                  ? AdminEventListItem()
                  : EventListItem();
            },
          ),
          Container(height: 70)
        ],
      ),
    );
  }
}
