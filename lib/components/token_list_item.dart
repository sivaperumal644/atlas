import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class TokenListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ORANGE_COLOR),
        boxShadow: [
          new BoxShadow(
            color: ORANGE_COLOR,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(height: 16),
          Text(
            'FOR ONE',
            style: TextStyle(color: ORANGE_COLOR, fontSize: 14),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: dottedLine(),
          ),
          Text(
            'Vegetarian Lunch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: RED_COLOR,
            ),
          ),
          Container(height: 4),
          Text(
            'From 2:30 PM to 3:30 PM',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(height: 32),
          Container(
            decoration: BoxDecoration(
              color: ORANGE_COLOR,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'REDEEM',
                style: TextStyle(
                  fontSize: 14,
                  color: WHITE_COLOR,
                  fontFamily: 'roboto',
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
                  color: ORANGE_COLOR.withOpacity(0.5),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
