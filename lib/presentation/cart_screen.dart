import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/add_to_cart_provider.dart';
import 'package:fruits_app_using_statemanagment/widgets/empty_cart_widget.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../repository/fruit_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "My Cart",
          style: TextStyle( fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<AddToCartProvider>(builder: (context, provider, widget) {
        if (addToCartList.isEmpty) {
          return const EmptyCartWidget();
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: addToCartList.length,
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
                                          image: AssetImage(addToCartList
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
                                      addToCartList.elementAt(index).name,
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
                                                  "\$${addToCartList.elementAt(index).price}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      color:
                                      Theme.of(context).primaryColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                        "${double.parse((addToCartList.elementAt(index).units! * addToCartList.elementAt(index).price).toStringAsFixed(2))}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      provider.decreaseUnit(addToCartList
                                          .elementAt(index));
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      //color: Theme.of(context).primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(4)),
                                    child: Text(
                                      addToCartList
                                          .elementAt(index)
                                          .units
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      provider.increaseUnit(addToCartList
                                          .elementAt(index));

                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(-5, -5),
                          blurRadius: 20)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Items Select",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${addToCartList.length}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\$',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: getAmountValue(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                       // showLoader(context);
                       // context.read<PlaceOrderBloc>().placeOrder();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  offset: const Offset(5, 5),
                                  blurRadius: 10),
                              BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 10)
                            ]),
                        child: const Text(
                          "Order Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }

  String getAmountValue() {
    List<double> totalamount = [];
    for (int i = 0; i < addToCartList.length; i++) {
      totalamount.add(
          addToCartList.elementAt(i).units! * addToCartList.elementAt(i).price);
    }

    return "${double.parse(totalamount.sum.toStringAsFixed(2))}";
  }
}

// void showLoader(
//   BuildContext ctx,
// ) {
//   showDialog(
//       context: ctx,
//       builder: (ctx) {
//         return BlocBuilder<PlaceOrderBloc, PlaceOrderStates>(
//             builder: (context, state) {
//           if (state is PlaceOrderLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return AlertDialog(
//               title: const Text('Order Placed'),
//               content: SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Image.asset("assets/check-circle.gif")),
//               actions: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     context.read<AddtoCartBLoc>().ordered();
//
//                     Navigator.of(context).pop();
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 40,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Text(
//                       "Okay",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 )
//                 // TextButton(
//               ],
//             );
//           }
//         });
//       });
// }
