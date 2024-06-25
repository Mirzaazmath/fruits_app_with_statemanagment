class Category{
  final String image;
  final String name;
  Category({required this.name,required this.image});
}

List<Category>categoryList=[
  Category(name: "Fruits",image: "assets/apple.png"),
  Category(name: "Vegies",image: "assets/tomato.png"),
  Category(name: "Nuts",image: "assets/nuts.png"),


];

class Fruit{
  final String image;
  final String name;
  final double price;
  int? units;

  Fruit({required this.image,required this.name,required this.price,this.units});

}

List<Fruit>fruitList=[
  Fruit(image: "assets/strawberry.webp",name: "Strawberry",price: 5.2),
  Fruit(image: "assets/pome.png",name: "Pomegranate",price: 15.3),
  Fruit(image: "assets/dragonfruit.png",name: "DragonFruit",price: 20.1,),
  Fruit(image: "assets/orange.webp",name: "Orange",price: 10.9,),
  Fruit(image: "assets/apple.png",name: "Apple",price: 18.5,),
  Fruit(image: "assets/pineapple.png",name: "PineApple",price: 25.7,),
  Fruit(image: "assets/watermelon.png",name: "Watermelon",price: 35.8,),
  Fruit(image: "assets/mango.png",name: "Mango",price: 12.4,),
  Fruit(image: "assets/banana.png",name: "Banana",price: 8.6,),
  Fruit(image: "assets/jackfruit.jpeg",name: "Jackfruit",price: 50.2,),

];

Set<Fruit>addToCartList={};
Set<Fruit>searchedList={};