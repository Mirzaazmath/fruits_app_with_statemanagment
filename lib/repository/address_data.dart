class Address{
  final int id;
 final  String title;
 final String  address;
 bool? isDefault;
 Address({required this.id, required this.title,required this.address,this.isDefault});
}
List<Address>addressList=[
  Address( id: 1, title: "Home", address: "1485 NW Street Street, Wilson, WY, instead of 1485 NW Street, Saint"),
  Address( id: 2,title: "Office", address: "1485 NW Street Street, Wilson, WY, instead of 1485 NW Street, Saint"),
  Address(id :3, title: "Gym", address: "1485 NW Street Street, Wilson, WY, instead of 1485 NW Street, Saint"),


];