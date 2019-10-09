import 'package:atlas/constants/colors.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class MoreOptionsListItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  const MoreOptionsListItem({
    this.title,
    this.subTitle,
    this.icon,
  });
  @override
  _MoreOptionsListItemState createState() => _MoreOptionsListItemState();
}

class _MoreOptionsListItemState extends State<MoreOptionsListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: WHITE_COLOR,
        boxShadow: [
          new BoxShadow(
            color: RED_COLOR.withOpacity(0.35),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            color: RED_COLOR.withOpacity(0.35),
            size: 36,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.subTitle,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Icon(FeatherIcons.arrowRight)
        ],
      ),
    );
  }
}
