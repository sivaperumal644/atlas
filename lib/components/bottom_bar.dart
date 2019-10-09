import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final ValueChanged<int> onTap;
  final int index;
  List<Map<String, Object>> iconData;

  BottomBar({this.onTap, this.index, List<IconData> icons, this.iconData}) {
    this.iconData = icons
        .asMap()
        .map((index, icon) => MapEntry(index, {"index": index, "value": icon}))
        .values
        .toList();
  }

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return bottomBar();
  }

  Widget bottomBar() {
    return Container(
      decoration: BoxDecoration(color: WHITE_COLOR, boxShadow: [
        BoxShadow(
          color: RED_COLOR.withOpacity(0.5),
          blurRadius: 10,
        )
      ]),
      height: 70,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: widget.onTap,
          backgroundColor: WHITE_COLOR,
          currentIndex: widget.index,
          type: BottomNavigationBarType.fixed,
          items: widget.iconData.map((icon) => barItem(icon)).toList(),
        ),
      ),
    );
  }

  BottomNavigationBarItem barItem(Map<String, Object> iconData) {
    return BottomNavigationBarItem(
      icon: Container(
        margin: EdgeInsets.only(top: 2),
        padding: EdgeInsets.all(7),
        child: Column(
          children: <Widget>[
            Icon(
              iconData['value'],
              size: 36,
              color: iconData['index'] == widget.index
                  ? ORANGE_COLOR
                  : RED_COLOR.withOpacity(0.6),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      title: Container(),
    );
  }
}
