import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../utils/app_enums.dart';

class PlaceOrderProvider extends ChangeNotifier {
  /// Create a _placeOrderApiStatus variable to handle the api status
  var _placeOrderApiStatus = ApiCallStatus.loading;

  /// Getter
  get placeOrderApiStatus => _placeOrderApiStatus;

  /// PLace Order Api Call
  void placeOrderApi() {
    Timer(const Duration(seconds: 4), () {
      /// Change the Status as success
      _placeOrderApiStatus = ApiCallStatus.success;

      /// notify its listeners
      notifyListeners();
    });
  }

  /// PLace Order Api Reset  Call
  void placeOrderApiReset() {
    /// Change the Status as success
    _placeOrderApiStatus = ApiCallStatus.loading;

    /// notify its listeners
    notifyListeners();
  }
}
