import 'package:atlas/components/bottom_bar.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/announcement_screen.dart';
import 'package:atlas/screens/more_screen.dart';
import 'package:atlas/screens/tokens_screen.dart';
import 'package:flutter/material.dart';

import 'event_screen.dart';

class NavigateScreen extends StatefulWidget {
  final int selectedIndex;

  const NavigateScreen({this.selectedIndex = 0});
  @override
  _NavigateScreenState createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: layout(),
      bottomNavigationBar: BottomBar(
        index: selectedIndex,
        icons: [
          Icons.casino,
          Icons.announcement,
          Icons.card_giftcard,
          Icons.menu
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget layout() {
    switch (selectedIndex) {
      case 0:
        return EventScreen();
      case 1:
        return AnnouncementScreen();
      case 2:
        return TokensScreen();
      case 3:
        return MoreScreen();
      default:
        return Container();
    }
  }
}
