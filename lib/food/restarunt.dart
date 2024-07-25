import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food/food/cart.dart';
import 'package:intl/intl.dart';

import 'foodclass.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> menue = [
    //burger
    Food(
        name: "Classic CheseBurger",
        discription:
            "popular fast-food item consisting of a juicy beef patty topped with melted cheese, often served in a bun with lettuce, tomato, onions, pickles, and various condiments",
        imagepath: "lib/images/burger/burger(1).jpg",
        price: 99.0,
        foodCategory: FoodCategory.burger,
        avalaibleaddons: [
          Addon(name: "Extra Cheese", price: 99.0),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 1.99),
        ]),
    Food(
      name: "Spicy Jalapeno Burger",
      discription:
          "A fiery burger with a beef patty, jalapenos, pepper jack cheese, lettuce, and spicy mayo, served in a toasted bun.",
      imagepath: "lib/images/burger/burger(2).jpg",
      price: 109.0,
      foodCategory: FoodCategory.burger,
      avalaibleaddons: [
        Addon(name: "Extra Jalapenos", price: 0.99),
        Addon(name: "Guacamole", price: 1.49),
        Addon(name: "Sriracha Sauce", price: 0.99),
      ],
    ),

    Food(
      name: "BBQ Bacon Burger",
      discription:
          "A savory burger with a beef patty, crispy bacon, cheddar cheese, BBQ sauce, lettuce, and onion rings, served in a toasted bun.",
      imagepath: "lib/images/burger/edward-franklin-Nb_Q-M3Cdzg-unsplash.jpg",
      price: 119.0,
      foodCategory: FoodCategory.burger,
      avalaibleaddons: [
        Addon(name: "Extra Bacon", price: 1.99),
        Addon(name: "Onion Rings", price: 1.49),
        Addon(name: "Smoked Gouda", price: 1.49),
      ],
    ),

    Food(
      name: "Mushroom Swiss Burger",
      discription:
          "A gourmet burger with a beef patty, sautéed mushrooms, Swiss cheese, lettuce, and garlic aioli, served in a toasted bun.",
      imagepath: "lib/images/burger/haseeb-jamil-J9lD6FS6_cs-unsplash (1).jpg",
      price: 129.0,
      foodCategory: FoodCategory.burger,
      avalaibleaddons: [
        Addon(name: "Extra Mushrooms", price: 1.49),
        Addon(name: "Truffle Oil", price: 1.99),
        Addon(name: "Provolone Cheese", price: 1.49),
      ],
    ),

    Food(
      name: "Hawaiian Burger",
      discription:
          "A tropical burger with a beef patty, grilled pineapple, ham, Swiss cheese, lettuce, and teriyaki sauce, served in a toasted bun.",
      imagepath: "lib/images/burger/mae-mu-I7A_pHLcQK8-unsplash (1).jpg",
      price: 139.0,
      foodCategory: FoodCategory.burger,
      avalaibleaddons: [
        Addon(name: "Extra Pineapple", price: 0.99),
        Addon(name: "Fried Egg", price: 1.49),
        Addon(name: "Pineapple Sauce", price: 0.99),
      ],
    ),

    //salads
    Food(
      name: "green salad",
      discription:
          "A salad is a versatile dish typically made with a variety of fresh vegetables, often complemented by fruits, nuts, cheese, and a flavorful dressing.",
      imagepath: "lib/images/salads/adam-bartoszewicz-_zXy4MvdWkA-unsplash.jpg",
      price: 139.0,
      foodCategory: FoodCategory.salads,
      avalaibleaddons: [
        Addon(name: "Extra Pineapple", price: 0.99),
        Addon(name: "Fried Egg", price: 1.49),
        Addon(name: "Pineapple Sauce", price: 0.99),
      ],
    ),
    Food(
      name: "Caesar Salad",
      discription:
          "A classic salad featuring crisp romaine lettuce, crunchy croutons, and Parmesan cheese, tossed in a creamy Caesar dressing.",
      imagepath: "lib/images/salads/egidijus-bielskis-EG0CGmA0g38-unsplash.jpg",
      price: 79.0,
      foodCategory: FoodCategory.salads,
      avalaibleaddons: [
        Addon(name: "Grilled Chicken", price: 1.99),
        Addon(name: "Extra Parmesan", price: 0.99),
        Addon(name: "Avocado", price: 1.49),
      ],
    ),

    Food(
      name: "Greek Salad",
      discription:
          "A refreshing salad with cucumbers, tomatoes, red onions, olives, and feta cheese, drizzled with olive oil and oregano.",
      imagepath: "lib/images/salads/israel-pina-xxnkDPKS5_c-unsplash.jpg",
      price: 89.0,
      foodCategory: FoodCategory.salads,
      avalaibleaddons: [
        Addon(name: "Extra Feta", price: 0.99),
        Addon(name: "Grilled Shrimp", price: 2.49),
        Addon(name: "Kalamata Olives", price: 0.99),
      ],
    ),

    Food(
      name: "Caprese Salad",
      discription:
          "A simple yet delicious salad featuring ripe tomatoes, fresh mozzarella, and basil, drizzled with balsamic glaze.",
      imagepath: "lib/images/salads/ryutaro-uozumi-ViNFPVVBPHg-unsplash.jpg",
      price: 99.0,
      foodCategory: FoodCategory.salads,
      avalaibleaddons: [
        Addon(name: "Extra Mozzarella", price: 1.49),
        Addon(name: "Prosciutto", price: 2.49),
        Addon(name: "Pesto Sauce", price: 0.99),
      ],
    ),

    Food(
      name: "Quinoa Salad",
      discription:
          "A nutritious salad with quinoa, mixed greens, cherry tomatoes, cucumbers, and red onions, topped with a lemon vinaigrette.",
      imagepath:
          "lib/images/salads/vita-marija-murenaite-gNfZVRZOdlY-unsplash.jpg",
      price: 109.0,
      foodCategory: FoodCategory.salads,
      avalaibleaddons: [
        Addon(name: "Feta Cheese", price: 0.99),
        Addon(name: "Roasted Chickpeas", price: 1.49),
        Addon(name: "Avocado", price: 1.49),
      ],
    ),

    //sides
    Food(
      name: "French Fries",
      discription:
          "Crispy and golden, these French fries are perfectly seasoned and ideal as a side or a snack.",
      imagepath: "lib/images/sides/angelo-pantazis-gMCO0iXeo_c-unsplash.jpg",
      price: 49.0,
      foodCategory: FoodCategory.sides,
      avalaibleaddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
        Addon(name: "Garlic Aioli", price: 0.99),
      ],
    ),

    Food(
      name: "Onion Rings",
      discription:
          "Deliciously crunchy onion rings coated in a golden batter, served with a tangy dipping sauce.",
      imagepath: "lib/images/sides/angelo-pantazis-gMCO0iXeo_c-unsplash.jpg",
      price: 59.0,
      foodCategory: FoodCategory.sides,
      avalaibleaddons: [
        Addon(name: "BBQ Sauce", price: 0.99),
        Addon(name: "Ranch Dressing", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.99),
      ],
    ),

    Food(
      name: "Mozzarella Sticks",
      discription:
          "Golden-fried mozzarella sticks with a crispy coating, served with marinara sauce for dipping.",
      imagepath: "lib/images/sides/brandy-s-mENa6dWQIKo-unsplash.jpg",
      price: 69.0,
      foodCategory: FoodCategory.sides,
      avalaibleaddons: [
        Addon(name: "Extra Marinara", price: 0.99),
        Addon(name: "Buffalo Sauce", price: 0.99),
        Addon(name: "Ranch Dressing", price: 0.99),
      ],
    ),

    Food(
      name: "Coleslaw",
      discription:
          "A refreshing side of shredded cabbage and carrots tossed in a tangy, creamy dressing.",
      imagepath: "lib/images/sides/fernanda-martinez-H2RzlOijhlQ-unsplash.jpg",
      price: 39.0,
      foodCategory: FoodCategory.sides,
      avalaibleaddons: [
        Addon(name: "Extra Dressing", price: 0.49),
        Addon(name: "Chopped Apples", price: 0.99),
        Addon(name: "Raisins", price: 0.99),
      ],
    ),

    Food(
      name: "Garlic Bread",
      discription:
          "Toasty slices of bread infused with garlic butter, perfect as a side or an appetizer.",
      imagepath:
          "lib/images/sides/logan-weaver-lgnwvr-qgZRZI-pKgM-unsplash.jpg",
      price: 49.0,
      foodCategory: FoodCategory.sides,
      avalaibleaddons: [
        Addon(name: "Extra Garlic Butter", price: 0.49),
        Addon(name: "Cheese Topping", price: 0.99),
        Addon(name: "Marinara Sauce", price: 0.99),
      ],
    ),
    //desserts
    Food(
      name: "Chocolate Lava Cake",
      discription:
          "A rich and decadent chocolate cake with a gooey molten center, served warm with a side of vanilla ice cream.",
      imagepath: "lib/images/desserts/abhishek-hajare-lJfeBZCleqc-unsplash.jpg",
      price: 99.0,
      foodCategory: FoodCategory.desserts,
      avalaibleaddons: [
        Addon(name: "Extra Ice Cream", price: 1.49),
        Addon(name: "Caramel Drizzle", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.99),
      ],
    ),

    Food(
      name: "Cheesecake",
      discription:
          "A classic creamy cheesecake with a graham cracker crust, available with various topping options.",
      imagepath:
          "lib/images/desserts/brenda-godinez-AAHdL8gp5b8-unsplash (1).jpg",
      price: 89.0,
      foodCategory: FoodCategory.desserts,
      avalaibleaddons: [
        Addon(name: "Strawberry Sauce", price: 0.99),
        Addon(name: "Blueberry Compote", price: 0.99),
        Addon(name: "Chocolate Shavings", price: 0.99),
      ],
    ),

    Food(
      name: "Tiramisu",
      discription:
          "An Italian dessert made with layers of coffee-soaked ladyfingers, mascarpone cheese, and cocoa powder.",
      imagepath:
          "lib/images/desserts/maxime-vandenberge-TF-EWMEk-ao-unsplash.jpg",
      price: 109.0,
      foodCategory: FoodCategory.desserts,
      avalaibleaddons: [
        Addon(name: "Extra Cocoa Powder", price: 0.49),
        Addon(name: "Espresso Shot", price: 1.49),
        Addon(name: "Chocolate Chips", price: 0.99),
      ],
    ),

    Food(
      name: "Apple Pie",
      discription:
          "A classic dessert with a flaky crust and a warm apple filling, served with a scoop of vanilla ice cream.",
      imagepath:
          "lib/images/desserts/serghei-savchiuc-kAajTkiUQ74-unsplash.jpg",
      price: 79.0,
      foodCategory: FoodCategory.desserts,
      avalaibleaddons: [
        Addon(name: "Extra Ice Cream", price: 1.49),
        Addon(name: "Caramel Sauce", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.99),
      ],
    ),
    Food(
      name: "Brownie Sundae",
      discription:
          "A warm, fudgy brownie topped with vanilla ice cream, chocolate syrup, and a cherry on top.",
      imagepath: "lib/images/desserts/shayna-douglas-1jHDbE_XgM0-unsplash.jpg",
      price: 99.0,
      foodCategory: FoodCategory.desserts,
      avalaibleaddons: [
        Addon(name: "Extra Ice Cream", price: 1.49),
        Addon(name: "Nuts", price: 0.99),
        Addon(name: "Marshmallows", price: 0.99),
      ],
    ),
//drinks
    Food(
      name: "Fresh Lemonade",
      discription:
          "A refreshing drink made from freshly squeezed lemons, water, and a touch of sweetness.",
      imagepath: "lib/images/drinks/brooke-lark-HjWzkqW1dgI-unsplash.jpg",
      price: 49.0,
      foodCategory: FoodCategory.drinks,
      avalaibleaddons: [
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Extra Lemon", price: 0.49),
        Addon(name: "Honey", price: 0.99),
      ],
    ),

    Food(
      name: "Iced Coffee",
      discription:
          "A chilled coffee beverage made with freshly brewed coffee, ice, and a choice of milk or cream.",
      imagepath: "lib/images/drinks/brooke-lark-HjWzkqW1dgI-unsplash.jpg",
      price: 59.0,
      foodCategory: FoodCategory.drinks,
      avalaibleaddons: [
        Addon(name: "Vanilla Syrup", price: 0.99),
        Addon(name: "Extra Shot of Espresso", price: 1.49),
        Addon(name: "Whipped Cream", price: 0.99),
      ],
    ),

    Food(
      name: "Smoothie",
      discription:
          "A creamy and nutritious blend of fruits, yogurt, and ice, available in various flavors.",
      imagepath: "lib/images/drinks/elevate-snnhGYNqm44-unsplash.jpg",
      price: 69.0,
      foodCategory: FoodCategory.drinks,
      avalaibleaddons: [
        Addon(name: "Protein Powder", price: 1.49),
        Addon(name: "Chia Seeds", price: 0.99),
        Addon(name: "Almond Butter", price: 1.49),
      ],
    ),

    Food(
      name: "Green Tea",
      discription:
          "A soothing and healthy drink made from high-quality green tea leaves, served hot or cold.",
      imagepath: "lib/images/drinks/james-yarema-wQFmDhrvVSs-unsplash.jpg",
      price: 39.0,
      foodCategory: FoodCategory.drinks,
      avalaibleaddons: [
        Addon(name: "Honey", price: 0.99),
        Addon(name: "Lemon", price: 0.49),
        Addon(name: "Ginger", price: 0.49),
      ],
    ),

    Food(
      name: "Mango Lassi",
      discription:
          "A traditional Indian drink made from blended mangoes, yogurt, and a touch of cardamom.",
      imagepath: "lib/images/drinks/tomasz-rynkiewicz-VEjN2jMxf0A-unsplash.jpg",
      price: 79.0,
      foodCategory: FoodCategory.drinks,
      avalaibleaddons: [
        Addon(name: "Extra Mango", price: 1.49),
        Addon(name: "Rose Water", price: 0.99),
        Addon(name: "Saffron", price: 1.49),
      ],
    ),
  ];

  final List<CartItem> cart = [];
  // add to cart method
  void addToCart(Food food, List<Addon> selectedAddon) {
    CartItem? cartItem = cart.firstWhereOrNull((element) {
      bool issamefood = element.food == food;
      bool issameaddon =
          ListEquality().equals(element.selectedAddon, selectedAddon);
      return issamefood && issameaddon;
    });
//if exists
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      cart.add(CartItem(food: food, selectedAddon: selectedAddon));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int index = cart.indexOf(cartItem);
    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index].quantity--;
      } else {
        cart.removeAt(index);
      }
    }
    notifyListeners();
  }

  double getTotalCartPrize() {
    double total = 0.0;
    for (CartItem cartItem in cart) {
      double itemtotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddon) {
        itemtotal = itemtotal + addon.price;
      }
      total = total + itemtotal * cartItem.quantity;
    }
    return total;
  }

  int gettotalItemcount() {
    int totalitemcount = 0;
    for (CartItem cartItem in cart) {
      totalitemcount = totalitemcount + cartItem.quantity;
    }
    return totalitemcount;
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

//generate recipt
  String displayCartRecipt() {
    final resipt = StringBuffer();
    resipt.writeln("here is yor resipt : ");
    resipt.writeln();
    String formateddate =
        DateFormat('yyyy-MM-dd MM:mm:ss').format(DateTime.now());
    resipt.writeln(formateddate);
    resipt.writeln('----------');
    for (CartItem cartItem in cart) {
      resipt.writeln(
          '${cartItem.quantity}  ${cartItem.food.name} - ${formatPrize(cartItem.food.price)}');
      if (cartItem.selectedAddon.isNotEmpty) {
        resipt.writeln('Addons : ${formatAddon(cartItem.selectedAddon)}');
      }
      resipt.writeln();
    }
    resipt.writeln('---------');
    resipt.writeln();
    resipt.writeln('Total Item : ${gettotalItemcount()}');
    resipt.writeln('Total Prize : ${formatPrize(getTotalCartPrize())}');
    return resipt.toString();
  }

  //resept
  String formatPrize(double price) {
    return "\$ ${price.toStringAsFixed(0)}";
  }

  //
  String formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${formatPrize(addon.price)}) ")
        .join('\n');
  }
}
