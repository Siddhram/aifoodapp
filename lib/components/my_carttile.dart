// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/my_quantityselector.dart';

import 'package:food/food/cart.dart';
import 'package:food/food/restarunt.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  CartItem cartItem;
  MyCartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: ((context, restaurant, child) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 7),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              children: [
                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the radius as needed
                  child: Image.asset(
                    cartItem.food.imagepath,
                    height: 80,
                    width: 80, // You can set the width as needed
                    fit: BoxFit.cover, // Adjust the fit property
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.food.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ₹ " + cartItem.food.price.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyQuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        increment: () {
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddon);
                        },
                        decrement: () {
                          restaurant.removeFromCart(cartItem);
                        }),
                  ],
                )
              ],
            ),
            //name prize
            SizedBox(
              height: cartItem.selectedAddon.length == 0 ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddon
                    .map((addon) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 0),
                          child: FilterChip(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: Row(children: [
                                Text(addon.name),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("₹" + addon.price.toString()),
                              ]),
                              shape: StadiumBorder(
                                  side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              )),
                              onSelected: (value) {}),
                        ))
                    .toList(),
              ),
            )

            //increment decrement
          ],
        ),
      );
    }));
  }
}
