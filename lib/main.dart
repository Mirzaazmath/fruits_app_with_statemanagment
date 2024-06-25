import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'presentation/home_screen.dart';
import 'providers/internet_provider.dart';
import 'providers/navbar_provider.dart';
import 'providers/product_provider.dart';
void main() async{
  /// Ensuring the Orientation SetUp
  WidgetsFlutterBinding.ensureInitialized();
  /// Setting the App to use only portraitUp mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        /// Provider to Handle Navbar State
        ChangeNotifierProvider(create: (_)=>NavbarProvider()),
        /// Provider to Handle Internet State
        ChangeNotifierProvider(create: (_)=>InternetProvider()),
        /// Provider to Handle Product Screen State
        ChangeNotifierProvider(create: (_)=>ProductProvider())
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          indicatorColor:const  Color(0xffd4ced6),
          scaffoldBackgroundColor:const  Color(0xfffaf6f3),
          cardTheme: const CardTheme(
            color: Colors.white
          )
        ),
        home: const HomeScreen(),
      
      ),
    );
  }
}
