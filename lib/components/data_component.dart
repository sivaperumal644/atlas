import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class DataComponent extends StatefulWidget {
  final String dataHeader;
  final String eventDescription;
  final String eventContent;
  final String eventPeriod;
  final String eventContent2;
  final String buttonText;
  final bool color;

  const DataComponent({
    this.dataHeader,
    this.eventDescription,
    this.eventContent,
    this.eventPeriod,
    this.eventContent2,
    this.buttonText,
    this.color = false,
  });

  @override
  _DataComponentState createState() => _DataComponentState();
}

class _DataComponentState extends State<DataComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: GREY_COLOR.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.dataHeader,
              style: TextStyle(
                color: RED_COLOR,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.eventDescription,
              style: TextStyle(
                color: widget.color ? RED_COLOR : GREY_COLOR,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.eventContent,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                widget.color ? Container(width: 16) : Container(),
                widget.color
                    ? Icon(
                        Icons.arrow_forward,
                        color: GREY_COLOR,
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: GREY_COLOR.withOpacity(0.5),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.eventPeriod,
              style: TextStyle(
                color: widget.color ? RED_COLOR : GREY_COLOR,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.eventContent2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                widget.color ? Container(width: 16) : Container(),
                widget.color
                    ? Icon(
                        Icons.arrow_forward,
                        color: GREY_COLOR,
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: GREY_COLOR.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.buttonText,
                style: TextStyle(
                  color: RED_COLOR,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(height: 20)
        ],
      ),
    );
  }
}
