import 'package:atlas/components/section_header.dart';
import 'package:atlas/components/token_list_item.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class TokensScreen extends StatelessWidget {
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
              titleText: 'Tokens',
              subTitleText: 'Tokens available to you',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: TokenListItem(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: TokenListItem(isRedeemed: true),
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
          Container(height: 24)
        ],
      ),
    );
  }
}
