import 'package:atlas/components/announcement_list_item.dart';
import 'package:atlas/components/dialog_style.dart';
import 'package:atlas/components/event_list_item.dart';
import 'package:atlas/components/more_options_list_item.dart';
import 'package:atlas/components/primary_button.dart';
import 'package:atlas/components/search_bar.dart';
import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/components/token_list_item.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24),
            child: SearchBar(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogStyle(
                        title: 'Registered',
                        contentParaOne:
                            'You’ve been added as a participant of Battle Royale. ',
                        contentParaTwo:
                            'Please be present at the event venue at the specified time. Have fun!',
                        buttonText: 'Got it',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isRed: true,
                      );
                    });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: SecondaryButton(
              text: 'CONTINUE',
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: TokenListItem(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: SectionHeader(
              titleText: 'Events',
              subTitleText: 'List of events at SNS Allora 2020',
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: AnnouncementListItem(),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: MoreOptionsListItem(
              icon: Icons.map,
              title: 'Venue Map',
              subTitle: 'View a map of this place',
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: EventListItem(),
          ),
        ],
      ),
    );
  }
}
