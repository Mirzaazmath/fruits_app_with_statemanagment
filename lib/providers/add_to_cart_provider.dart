import 'package:flutter/cupertino.dart';

import '../repository/fruit_data.dart';

class AddToCartProvider extends ChangeNotifier {
  /// Note We are Using Set in addToCartList  so we don't have to worry about duplication

  /// Add to Cart Method
  void addToCartForFirsTime(Fruit item) {
    /// Assigning the unit value as 1
    item.units = 1;

    /// Adding item to addToCartList
    addToCartList.add(item);

    /// Notifying its listeners
    notifyListeners();
  }

  /// Increment Method
  void increaseUnit(Fruit item) {
    /// Increasing the Unit by 1
    item.units = item.units! + 1;

    /// Adding item to addToCartList
    addToCartList.add(item);

    /// Notifying its listeners
    notifyListeners();
  }

  /// Increment Method
  void placeOrder() {
    /// Clearing the addToCartList because we have placed the order successfully
    addToCartList.clear();

    /// Notifying its listeners
    notifyListeners();
  }

  /// Decrease Method
  void decreaseUnit(Fruit item) {
    /// Decreasing the Unit by 1
    item.units = item.units! - 1;

    /// Checking the condition whether the Unit Decreasing reached to zero
    if (item.units! <= 0) {
      /// If True we are remove that item from addToCartList
      addToCartList.remove(item);
    } else {
      /// if false we are again adding item to addToCartList
      addToCartList.add(item);
    }

    /// Notifying its listeners
    notifyListeners();
  }
}
