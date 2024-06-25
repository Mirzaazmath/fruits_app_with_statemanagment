import 'package:flutter/cupertino.dart';

class NavbarProvider extends ChangeNotifier {

  /// Index to handle Screens in homeScreen
  int _index = 0;

  /// Index getter;
  get index => _index;

  /// Update Index Method
  void updateIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
