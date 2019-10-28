import 'package:atlas/components/simple_line_chart.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class ActivityTimeline extends StatefulWidget {
  final String title;

  const ActivityTimeline({this.title});
  @override
  _ActivityTimelineState createState() => _ActivityTimelineState();
}

class _ActivityTimelineState extends State<ActivityTimeline> {
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
                Container(
                  height: 120,
                  child: SimpleLineChart.withSampleData(),
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
