import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_state.dart';

class TokenRedeemScreen extends StatefulWidget {
  final String tokenTitle;
  final String tokenType;
  final String id;

  const TokenRedeemScreen({Key key, this.tokenTitle, this.tokenType, this.id}) : super(key: key);
  @override
  _TokenRedeemScreenState createState() => _TokenRedeemScreenState();
}

class _TokenRedeemScreenState extends State<TokenRedeemScreen> {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    UserModel currentUser = appState.getUser;
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
              subTitleText: '${widget.tokenTitle}',
            ),
          ),
          Container(height: 8),
          Center(
            child: QrImage(
              data: currentUser.id,
              size: 250,
            ),
          ),
          Container(height: 50),
          orDivider(context),
          Container(
            margin: EdgeInsets.fromLTRB(24, 40, 24, 40),
            child: Center(
              child: Text(
                '${currentUser.id}',
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
