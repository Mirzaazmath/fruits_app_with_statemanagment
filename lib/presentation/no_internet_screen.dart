import 'package:flutter/material.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: [
        Center(
          child: SizedBox(
            height: 150,
              width: 150,
              child: Image.asset("assets/nointernet.gif")),
        ),
       const  SizedBox(height: 20,),
        Text("No Internet",style: Theme.of(context).textTheme.displaySmall,)
      ],
    );
  }
}