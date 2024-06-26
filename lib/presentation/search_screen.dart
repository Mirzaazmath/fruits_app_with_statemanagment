import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/search_provider.dart';
import 'package:provider/provider.dart';

import '../providers/add_to_cart_provider.dart';
import '../repository/fruit_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchProvider>().searchProduct("");
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3))),
          child: TextFormField(
            onChanged: (value) {
              context.read<SearchProvider>().searchProduct(value);
            },
            decoration: InputDecoration(
                hintText: "Search..",
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<SearchProvider>(builder: (context, provider, widget) {
          return Expanded(
            child: searchedList.isEmpty
                ? Container()
                : ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: searchedList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(searchedList
                                              .elementAt(index)
                                              .image),
                                          fit: BoxFit.fill))),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      searchedList.elementAt(index).name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Price: ',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  "\$${searchedList.elementAt(index).price}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                              Consumer<AddToCartProvider>(
                                  builder: (context, provider, widget) {
                                    /// Checking whether the item is in  addToCartList or not
                                    if (!addToCartList.contains(searchedList.elementAt(index))) {
                                      /// if Not Display Add  Button
                                      return GestureDetector(
                                        onTap: () {
                                          provider.addToCartForFirsTime(searchedList.elementAt(index));
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
                                              (element) => element.name == searchedList.elementAt(index).name);

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
                                                provider.decreaseUnit(searchedList.elementAt(index));
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
                                                provider.increaseUnit(searchedList.elementAt(index));
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
                                  }),
                            ],
                          ),
                        ),
                      );
                    }),
          );
        }),
      ],
    );
  }
}
