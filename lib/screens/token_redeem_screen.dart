import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class TokenRedeemScreen extends StatefulWidget {
  @override
  _TokenRedeemScreenState createState() => _TokenRedeemScreenState();
}

class _TokenRedeemScreenState extends State<TokenRedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          appBar(),
          Container(
            margin: EdgeInsets.all(24),
            child: SectionHeader(
              titleText: 'Redeem Token',
              subTitleText: 'Vegetarian Lunch',
            ),
          ),
          Container(height: 8),
          Image.asset(
            'assets/images/lunch_token.png',
            width: 256,
            height: 256,
          ),
          Container(height: 50),
          orDivider(context),
          Container(
            margin: EdgeInsets.fromLTRB(24, 40, 24, 40),
            child: Center(
              child: Text(
                '334RT6HGY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget orDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width / 2.65,
          color: GREY_COLOR,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(
              fontSize: 16,
              color: GREY_COLOR,
            ),
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width / 2.65,
          color: GREY_COLOR,
        ),
      ],
    );
  }

  Widget appBar() {
    return Container(
      margin: EdgeInsets.only(left: 14, bottom: 8),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: BLACK_COLOR,
          ),
        ),
      ),
    );
  }
}
