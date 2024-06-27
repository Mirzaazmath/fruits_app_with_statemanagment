// import 'package:flutter/material.dart';
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//     );
//   }
// }

import 'package:flutter/material.dart';
class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return  InkWell(
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeliveryStatus()),),
              child:Card(
                elevation: 3,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 60,

                          child: Image.asset("assets/apple.png",fit: BoxFit.fill,),

                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text("My Order",style: TextStyle(fontSize: 20),),

                            ),
                            Padding(padding: EdgeInsets.only(left: 5),
                              child:     Text("OrderId:123456",style: TextStyle(fontSize: 10)),
                            ),


                          ],
                        ),

                      ],



                    ),

                    Icon(Icons.arrow_forward_sharp)


                  ],
                ),
              )
          );

        });
  }
}
class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus({Key? key}) : super(key: key);

  @override
  _DeliveryStatusState createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),

              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('TRACK ORDER',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    );
                  },
                  body: Container(
                    child: TimeLine(),
                  ),
                  isExpanded: _expanded,
                  canTapOnHeader: true,

                ),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {

                });
              },
            ),

            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0
                  ),
                ),
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Need Help with order?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 10,),
                          Container(
                            margin:EdgeInsets.fromLTRB(10,10,10,0),
                            child: ElevatedButton(onPressed: (){
                              print("button pressed");
                            },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Contact Customer Support"),
                                    Icon(Icons.arrow_forward_sharp)
                                  ],
                                )),

                          ),
                        ],
                      ),
                    ))
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0
                  ),
                ),
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Do you want to cancel the order ?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 20,),
                          Container(

                            width: 350,
                            margin: EdgeInsets.fromLTRB(10,10,10,0),
                            child: ElevatedButton(
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10)),
                              // splashColor: Colors.black,
                              // color: Colors.red,
                              // textColor: Colors.white,
                                onPressed: (){},
                                child: Text("CANCEL ORDER")),
                          ),

                        ],
                      ),
                    ))
            ),



            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0
                  ),
                ),
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Delivery Estimation", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 10,),



                          Text("09:00 AM, Wednesday 12-01-2022 ",style: TextStyle(),overflow: TextOverflow.ellipsis,maxLines: 4,),


                        ],
                      ),
                    ))
            ),


            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),

                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Your Mobile Number", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 10,),

                          Text("Depending on how you obtained the Windows software, this is a license agreement between (i) you and the device manufacturer or software installer that distributes the software with your device; or (ii) you and Microsoft Corporation (or, based on where you live or, if a business, where your principal place of business is located, one of its affiliates) if you acquired the software from a retailer. Microsoft is the device manufacturer for devices produced by Microsoft or one of its affiliates, and Microsoft is the retailer if you acquired the software directly from Microsoft. Note that if you are a volume license customer, use of this software is subject to your volume license agreement rather than this agreement. This agreement describes your rights and the conditions upon which you may use the Windows software. You should review the entire agreement, including any supplemental license terms that accompany the software and any linked terms, because all of the terms are important and together create this agreement that applies to you. You can review linked terms by pasting the (aka.ms/) link into a browser window.",style: TextStyle(),overflow: TextOverflow.ellipsis,maxLines: 4,),
                          SizedBox(height: 10,),
                          Text("9876543210",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),

                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 10,),

                          Text("Depending on how you obtained the Windows software, this is a license agreement between (i) you and the device manufacturer or software installer that distributes the software with your device; or (ii) you and Microsoft Corporation (or, based on where you live or, if a business, where your principal place of business is located, one of its affiliates) if you acquired the software from a retailer. Microsoft is the device manufacturer for devices produced by Microsoft or one of its affiliates, and Microsoft is the retailer if you acquired the software directly from Microsoft. Note that if you are a volume license customer, use of this software is subject to your volume license agreement rather than this agreement. This agreement describes your rights and the conditions upon which you may use the Windows software. You should review the entire agreement, including any supplemental license terms that accompany the software and any linked terms, because all of the terms are important and together create this agreement that applies to you. You can review linked terms by pasting the (aka.ms/) link into a browser window.",style: TextStyle(),overflow: TextOverflow.ellipsis,maxLines: 4,),


                        ],
                      ),
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),

                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child:Padding(
                      padding: EdgeInsets.all(10) ,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Purchase details", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          SizedBox(height: 10,),

                          Container(
                            child:purchase() ,
                          ),
                          ElevatedButton(onPressed:  ()=> Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Items()),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Items(10)"),
                                  Icon(Icons.arrow_forward_sharp)
                                ],
                              )),



                        ],
                      ),
                    ))),

            Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),

              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child:Padding(
                  padding: EdgeInsets.all(10) ,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Order summary",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("OrderId",style: TextStyle(fontSize: 10),)
                        ],
                      ), Row(
                        children: [
                          Text("Order date",style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Items subtotal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          Text("£ 100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery charge:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          Text("£ 25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                        ],
                      ),
                      SizedBox(height: 3,),


                      SizedBox(height: 3,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Est:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          Text("£ 12.5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          Text("£ 137.5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Grand total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("£ 137.5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      ),
                      Divider(

                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text("Payment Methods",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                        ],
                      ),
                      Container(
                          height: 60,
                          child:Row(
                            children: [
                              Text("payment done by stripe .",style: TextStyle(fontSize: 15),),
                            ],
                          )
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ) ,
      ),
    );
    ;

  }
}

class TimeLine extends StatefulWidget {

  const TimeLine({Key? key}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  late List<TimeLineCard> timeline;


  @override
  void initState() {
    super.initState();
    timeline =_getcards();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics:ClampingScrollPhysics() ,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: timeline.length,
          itemBuilder: (context,index){
            return Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 2,
                        height: 50,
                        color:index==0? Colors.white: Colors.black,

                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5,right: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.check,color: Colors.white,),
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        color:index==timeline.length-1? Colors.white: Colors.black,

                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(top: BorderSide(width: 4,color: Colors.red)),
                            boxShadow:[ BoxShadow(
                              blurRadius:10,
                              color: Colors.black26,
                            )]
                        ),
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(timeline[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(timeline[index].descripton,style: TextStyle(fontSize: 16,),),

                            ],
                          ),
                        ),
                      )),

                ],
              ),
            );
          }),
    );
  }
  List<TimeLineCard>_getcards(){
    List<TimeLineCard>timelineCard =[];
    timelineCard.add(TimeLineCard("OrderPlaced", "The order is placed please wait .." ));
    timelineCard.add(TimeLineCard("Packing", "packing has stared " ));
    timelineCard.add(TimeLineCard("Out for delivery", "the order is now out for delivery" ));
    timelineCard.add(TimeLineCard("On The Way", "The order is now on the way to reach you" ));
    timelineCard.add(TimeLineCard("Delivered", "The order is delivered" ));
    return timelineCard;
  }
}
class TimeLineCard{
  String title;
  String descripton;

  TimeLineCard(this.title,this.descripton,);
}
class purchase extends StatefulWidget {
  const purchase({Key? key}) : super(key: key);

  @override
  _purchaseState createState() => _purchaseState();
}

class _purchaseState extends State<purchase> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 120,

        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[

              Expanded(
                child:
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width:10,
                      );
                    },
                    itemCount:5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:( BuildContext context,int index) {
                      return
                        Column(

                            children: [
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),),



                                child:Container(
                                  height:80,
                                  width: 80,
                                  decoration:BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(

                                      image:
                                      AssetImage("assets/images/delivery.png"),fit: BoxFit.fill,
                                    ),
                                  ),
                                  /*  child:  Image(image: AssetImage(a3[index]),fit: BoxFit.fill,
                                ),*/
                                ),
                              ),


                              Text("product")
                            ]);






                    }
                ),




              ),
              SizedBox(width: 10,),

            ]
        ),
      );
  }
}
class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("purchase details"),
      ),
      body:  ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Card(
              elevation: 3,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(

                        height: 80,
                        width: 60,

                        child: Image.asset("assets/apple.png",fit: BoxFit.fill,),

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text("washinton apple",style: TextStyle(fontSize: 20),),

                          ),
                          Padding(padding: EdgeInsets.only(left: 5),
                            child:     Text("Qty:4",style: TextStyle(fontSize: 10)),
                          ),


                        ],
                      ),

                    ],



                  ),
                  Text("£ 10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),




                ],
              ),
            );


          }),

    );
  }
}


