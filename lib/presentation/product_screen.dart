import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/product_provider.dart';
import 'package:fruits_app_using_statemanagment/utils/app_enums.dart';
import 'package:fruits_app_using_statemanagment/widgets/error_widget.dart';
import 'package:fruits_app_using_statemanagment/widgets/product_loader_widget.dart';
import 'package:provider/provider.dart';

import 'product_loaded_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ProductProvider>(
      builder: (context,provider,widget) {
        if(provider.productApiStatus == ApiCallStatus.loading) {
          /// Loading State
          return const ProductLoadingScreen();
        }else if(provider.productApiStatus == ApiCallStatus.success){
          /// Loaded State
          return const  ProductLoadedWidget();
        }else{
          /// Error State
          return const CustomErrorWidget();
        }

      }
    );
  }
}
