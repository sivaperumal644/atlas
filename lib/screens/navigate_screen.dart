import 'package:atlas/components/bottom_bar.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/announcement_screen.dart';
import 'package:atlas/screens/more_screen.dart';
import 'package:atlas/screens/tokens_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import 'dashboard_screen.dart';
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
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: appState.getIsAdmin ? adminLayout() : layout(),
      bottomNavigationBar: BottomBar(
        index: selectedIndex,
        icons: appState.getIsAdmin
            ? [
                Icons.dashboard,
                Icons.casino,
                Icons.announcement,
                Icons.card_giftcard,
                Icons.menu
              ]
            : [
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

  Widget adminLayout() {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return EventScreen();
      case 2:
        return AnnouncementScreen();
      case 3:
        return TokensScreen();
      case 4:
        return MoreScreen();
      default:
        return Container();
    }
  }
}
