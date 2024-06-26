import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/add_to_cart_provider.dart';
import 'package:fruits_app_using_statemanagment/repository/fruit_data.dart';
import 'package:provider/provider.dart';

import '../presentation/cart_screen.dart';

class AppBarWidget extends StatelessWidget  implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/person.jpeg"),
        ),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi Dev_73arner",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Good Morning",
            style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
            )),
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CartScreen()));
                },
                icon: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).primaryColor,
                )),
              Positioned(
                right: 10,
                top: 10,
                child: Consumer<AddToCartProvider>(
                  builder: (context,provider,widget) {
                    return  addToCartList.isEmpty?const SizedBox(): Badge(
                      label:  Text(
                        addToCartList.length.toString(),
                        style:  const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                ))
          ],
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
