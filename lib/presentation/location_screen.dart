import 'package:flutter/material.dart';

import '../repository/address_data.dart';
import '../utils/botton_sheet_util.dart';
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: addressList.length,
      itemBuilder: (context,index) {
        Address data= addressList[index];
        return Container(
          margin:const  EdgeInsets.only(top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: data.id,
                  onChanged: (value) {
                  },),
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(child: Text(data.title,style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1,)),
                    data.isDefault==true? const  Badge(
                      backgroundColor: Colors.orange,
                      label: Text("Default",style: TextStyle(fontWeight: FontWeight.bold)),):const SizedBox()
                  ],
                ),
                subtitle:  Text(data.address,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
              TextButton.icon(onPressed: (){
                /// Showing Bottom Sheet
                showMapAddressBottomSheet(context,data);
              }, label:const  Text("Show on Map"),
              icon:const  Icon(Icons.location_on_outlined))
            ],
          ),
        );
      }
    );
  }

}
