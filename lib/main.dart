import 'package:atlas/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      builder: (_) => AppState(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'IBMPlexSans'),
        home: LoginScreen(),
      ),
    );
  }
}
