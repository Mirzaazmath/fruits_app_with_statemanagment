import 'package:flutter/material.dart';
import 'package:fruits_app_using_statemanagment/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

import '../repository/nav_bar_model.dart';
class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
        padding:const  EdgeInsets.symmetric(vertical: 13,horizontal: 15),
        decoration:const  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
              topRight: Radius.circular(25), )
        ),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for(int i=0;i<navbarlist.length;i++)...[
              Consumer<NavbarProvider>(
                builder: (context,provider,widget) {
                  return GestureDetector(
                    onTap: (){
                      /// Calling updateIndex of NavbarProvider
                      provider.updateIndex(i);
                    },
                    child: Column(
                      children: [
                        Icon(navbarlist[i].icon,color:provider.index==i?Theme.of(context).primaryColor: Theme.of(context).indicatorColor,),
                        const  SizedBox(height: 2,),
                        Text(navbarlist[i].title,style: TextStyle(color:provider.index==i?Theme.of(context).primaryColor: Theme.of(context).indicatorColor),)
                      ],
                    ),
                  );
                }
              )
            ]
          ],
        )
    );
  }
}
