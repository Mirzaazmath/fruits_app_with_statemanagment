import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  /// Create a variable to handle the category
  int _index = 0;

  /// Getter
  get index => _index;

  /// updateCategory to handle category updates
  void updateCategory(int value) {
    _index = value;
    notifyListeners();
  }
}
