import 'package:flutter/material.dart';
class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/empty.png"),
    );
  }
}
