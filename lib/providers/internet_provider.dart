import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../utils/app_enums.dart';

class InternetProvider extends ChangeNotifier {
  /// here we are Initializing the connectivity package
  Connectivity _connectivity = Connectivity();

  /// Create a varaible to check internet Status
  var _internetStatus = NetworkStatus.connected;

  /// Create a getter
  get internetStatus => _internetStatus;

  /// Here we are Creating the StreamSubscription to close the listen function when no longer needed
  StreamSubscription? connectivitySubscription;

  void checkInternetConnection() {
    debugPrint(
        "////// *******  Checking the Internet Connection ***** ////////// ");

    /// here we assigning the connectivitySubscription to onConnectivityChanged  function
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        /// When Internet is connected
        _internetStatus = NetworkStatus.connected;
        notifyListeners();
        debugPrint("////// *******  Internet Connected ***** ////////// ");
      } else {
        /// When Internet is not  connected
        _internetStatus = NetworkStatus.disconnected;
        notifyListeners();
        debugPrint("////// *******  Internet Disconnected ***** ////////// ");
      }
    });
  }
}


