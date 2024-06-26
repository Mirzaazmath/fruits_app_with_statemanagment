import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

import '../repository/fruit_data.dart';

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Top Item",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          children: <Widget>[
            for (int i = 0; i < fruitList.length; i++) ...[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(fruitList[i].image),
                                  fit: BoxFit.fill))),
                      Text(
                        fruitList[i].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Price: ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: "\$${fruitList[i].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Consumer<AddToCartProvider>(
                          builder: (context, provider, widget) {
                        /// Checking whether the item is in  addToCartList or not
                        if (!addToCartList.contains(fruitList[i])) {
                          /// if Not Display Add  Button
                          return GestureDetector(
                            onTap: () {
                              provider.addToCartForFirsTime(fruitList[i]);
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else {
                          /// Getting the exact item from addToCartList to display the counter
                          Fruit item = addToCartList.firstWhere(
                              (element) => element.name == fruitList[i].name);

                          /// Else show increment and decrement buttons with counter
                          return SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Decrease Button
                                GestureDetector(
                                  onTap: () {
                                    /// Calling  Decrease method
                                    provider.decreaseUnit(fruitList[i]);
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                /// Counter section
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      //color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    item.units.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                /// Increase Button
                                GestureDetector(
                                  onTap: () {
                                    /// Calling Increase Method
                                    provider.increaseUnit(fruitList[i]);
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ),
            ]
          ],
        )
      ],
    );
  }
}
