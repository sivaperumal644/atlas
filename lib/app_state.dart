import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isAdmin = false;

  void setIsAdmin(bool val) {
    isAdmin = val;
    notifyListeners();
  }

  get getIsAdmin => isAdmin;
}
