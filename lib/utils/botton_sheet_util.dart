import 'package:flutter/material.dart';
import '../repository/address_data.dart';


void showMapAddressBottomSheet(context,Address data ){
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(data.title,style:const  TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          const   SizedBox(height: 10,),
            Text(data.address),
           const  SizedBox(height: 10,),
           Container(
             height: 150,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               image: DecorationImage(
                 image: AssetImage("assets/map.png"),fit: BoxFit.cover
               )
             ),
           ),
            const   SizedBox(height: 10,),
            Center(
              child: ElevatedButton(

                child: const Text('Set As Defautl'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    },
  );
}