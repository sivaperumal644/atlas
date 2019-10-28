import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class AdminTokenListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: GREY_COLOR, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Vegetarian Lunch',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(height: 8),
                Text(
                  'Meal coupon',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: GREY_COLOR.withOpacity(0.5),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: Text(
              'Granted to all registered participants',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Claimed: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(width: 12),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        '40 / 80',
                        style: TextStyle(
                          color: WHITE_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
          Container(height: 20)
        ],
      ),
    );
  }
}
