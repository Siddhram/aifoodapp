// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food/food/foodclass.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddon;
  int quantity;
  CartItem({
    required this.food,
    required this.selectedAddon,
    this.quantity = 1,
  });
  double get totalprise {
    double addonprize =
        selectedAddon.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonprize) * quantity;
  }
}
