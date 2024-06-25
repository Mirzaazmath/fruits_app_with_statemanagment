import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/widgets/top_item_widget.dart';


import '../widgets/category_widget.dart';
import '../widgets/popular_widget.dart';

class ProductLoadedWidget extends StatelessWidget {
  const ProductLoadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),

          /// **** Category Section *****////
          CategoryWidget(),

          /// **** Popular Section *****////
          PopularWidget(),

          /// **** Top Item Section *****////
          TopItemWidget(),
        ],
      ),
    );
  }
}
