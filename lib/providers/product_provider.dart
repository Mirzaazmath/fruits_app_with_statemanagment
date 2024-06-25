import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fruits_app_using_statemanagment/utils/app_enums.dart';

class ProductProvider extends ChangeNotifier {
  /// Super Constructor
  ProductProvider() {
    /// Api Calling to fetch data from server
    fetchDataApi();
  }

  /// Create a _productApiStatus variable to handle the api status
  var _productApiStatus = ApiCallStatus.loading;
  /// Getter
  get productApiStatus => _productApiStatus;

  /// Fetch Api call
  void fetchDataApi() {
    ///faking api call with timer
    Timer(const Duration(seconds: 4), () {
      _productApiStatus = ApiCallStatus.success;
      /// updating the _productApiStatus with success response
      notifyListeners();

    });
  }
}
