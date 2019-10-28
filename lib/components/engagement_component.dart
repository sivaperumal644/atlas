import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class EngagementComponent extends StatefulWidget {
  final String title;
  final String count;
  final String registeredText;
  final String totalCapacity;

  const EngagementComponent({
    this.title,
    this.count,
    this.registeredText,
    this.totalCapacity,
  });
  @override
  _EngagementComponentState createState() => _EngagementComponentState();
}

class _EngagementComponentState extends State<EngagementComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: RED_COLOR,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: WHITE_COLOR.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    widget.count,
                    style: TextStyle(
                      color: WHITE_COLOR.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      widget.registeredText,
                      style: TextStyle(
                        color: WHITE_COLOR,
                        fontSize: 14,
                      ),
                    ),
                    Container(width: 0),
                    Text(
                      widget.totalCapacity,
                      style: TextStyle(
                        color: WHITE_COLOR.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: WHITE_COLOR,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'VIEW BREAKDOWN',
              style: TextStyle(
                color: WHITE_COLOR,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
