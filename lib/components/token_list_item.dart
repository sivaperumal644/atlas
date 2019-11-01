import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/UserModel.dart';
import 'package:atlas/screens/login_qr_scan_screen.dart';
import 'package:atlas/screens/token_redeem_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class TokenListItem extends StatelessWidget {
  final bool isRedeemed;
  final String tokenTitle;
  final String tokenType;
  final String id;
  const TokenListItem({this.isRedeemed = false, this.tokenTitle, this.tokenType, this.id});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    UserModel currentUser = appState.getUser;
    return Container(
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isRedeemed ? GREY_COLOR.withOpacity(0.2) : ORANGE_COLOR),
        boxShadow: isRedeemed
            ? null
            : [
                new BoxShadow(
                  color: RED_COLOR.withOpacity(0.5),
                  blurRadius: 20.0,
                ),
              ],
      ),
      child: Column(
        children: <Widget>[
          Container(height: 16),
          Text(
            'FOR ONE',
            style: TextStyle(
                color: isRedeemed ? GREY_COLOR : ORANGE_COLOR, fontSize: 14),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: dottedLine(),
          ),
          Text(
            '${tokenTitle}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isRedeemed ? GREY_COLOR : RED_COLOR,
            ),
          ),
          Container(height: 4),
          Text(
            '${tokenType}',
            style: TextStyle(
                fontSize: 14, color: isRedeemed ? GREY_COLOR : BLACK_COLOR),
          ),
          Container(height: 32),
          Material(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: isRedeemed
                  ? null
                  : () {
                if(appState.getIsAdmin == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScannerScreen(
                    scanToken: id
                  ) ));
                } else
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TokenRedeemScreen(
                            id: id,
                            tokenType: tokenType,
                            tokenTitle: tokenTitle,
                          ),
                        ),
                      );
                    },
              child: Container(
                decoration: BoxDecoration(
                  color: isRedeemed ? WHITE_COLOR : ORANGE_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11),
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    isRedeemed ? 'REDEEMED' : 'REDEEM',
                    style: TextStyle(
                      fontSize: 14,
                      color: isRedeemed ? GREY_COLOR : WHITE_COLOR,
                      fontFamily: 'roboto',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  LayoutBuilder dottedLine() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.constrainWidth();
        final dashCount = (width / (1.5 * 10)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: 10,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isRedeemed
                      ? GREY_COLOR.withOpacity(0.3)
                      : ORANGE_COLOR.withOpacity(0.5),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
