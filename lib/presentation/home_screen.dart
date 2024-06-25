import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/internet_provider.dart';
import '../providers/navbar_provider.dart';
import '../utils/app_enums.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_navbar_widget.dart';
import 'location_screen.dart';
import 'no_internet_screen.dart';
import 'product_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Provider.of<InternetProvider>(context, listen: false)
        .checkInternetConnection();

    return Scaffold(
        /// **** AppBar ***///
        appBar: const AppBarWidget(),

        /// **** Body ***///
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Consumer<InternetProvider>(
            builder: (context,internetProvider,widget) {
              return Consumer<NavbarProvider>(builder: (context, provider, widget) {
                return internetProvider.internetStatus==NetworkStatus.disconnected?const NoInternetScreen(): screens[provider.index];
              });
            }
          ),
        ),

        /// **** NavBar ***///
        bottomNavigationBar: const NavbarWidget());
  }
}

/// List Of Screens
List<Widget> screens = const [
  ProductScreen(),
  SearchScreen(),
  LocationScreen(),
  ProfileScreen(),
];
