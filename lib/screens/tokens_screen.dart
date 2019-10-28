import 'package:atlas/components/admin_token_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/components/token_list_item.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/add_new_token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class TokensScreen extends StatelessWidget {
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
                    builder: (context) => AddNewToken(),
                  ),
                );
              },
            )
          : null,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            child: SectionHeader(
              titleText: 'Tokens',
              subTitleText: 'Tokens available to you',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: appState.getIsAdmin ? AdminTokenListItem() : TokenListItem(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: appState.getIsAdmin
                ? AdminTokenListItem()
                : TokenListItem(isRedeemed: true),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              'Please contact the nearest volunteer if you are facing any issues',
              style: TextStyle(
                fontSize: 12,
                color: GREY_COLOR,
              ),
            ),
          ),
          Container(height: 64)
        ],
      ),
    );
  }
}
