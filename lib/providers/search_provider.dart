import 'package:flutter/cupertino.dart';

import '../repository/fruit_data.dart';

class SearchProvider extends ChangeNotifier {


  /// Search Product Method
  void searchProduct(String letters) {
    /// Clear search List
    searchedList.clear();
    if (letters == "") {
      /// if letters are empty Clear search List
      searchedList.clear();
    } else {
      /// Filtering the fruitList and Saving the data in searchedList
      searchedList = fruitList
          .where((element) =>
              element.name.toLowerCase().contains(letters.toLowerCase()))
          .toSet();
    }

    /// Notify its Listeners
    notifyListeners();
  }
}
