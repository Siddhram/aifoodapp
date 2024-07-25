class Food {
final String name;
final String discription;
final String imagepath;
final double price;
final FoodCategory foodCategory;
List<Addon> avalaibleaddons;
  Food({
    required this.name,
    required this.discription,
    required this.imagepath,
    required this.price,
    required this.foodCategory,
    required this.avalaibleaddons,
  });

}

enum FoodCategory{
  burger,
  salads,
  sides,
  desserts,
  drinks
}

class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
