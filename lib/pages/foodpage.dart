// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/mybutton.dart';
import 'package:food/food/aipage.dart';

import 'package:food/food/foodclass.dart';
import 'package:food/food/restarunt.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  Map<Addon, bool> selectedAddon = {};

  FoodPage({
    Key? key,
    required this.food,
  }) : super(key: key) {
    for (Addon eachAddon in food.avalaibleaddons) {
      selectedAddon[eachAddon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //adding to cart
  addtocart(Food food, Map<Addon, bool> selectedAddon) {
    Navigator.pop(context);
    List<Addon> currntyselectedaddons = [];
    for (Addon addon in widget.food.avalaibleaddons) {
      if (widget.selectedAddon[addon] == true) {
        currntyselectedaddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currntyselectedaddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            widget.food.imagepath,
            height: 320,
            width: 360,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "₹ " + widget.food.price.toString(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.discription,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'Adons',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.food.avalaibleaddons.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      Addon addon = widget.food.avalaibleaddons[index];
                      return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text("₹ " + addon.price.toString()),
                          value: widget.selectedAddon[addon],
                          onChanged: (value) {
                            setState(() {
                              widget.selectedAddon[addon] = value!;
                            });
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
          Mybutton(
              ontap: () {
                // addtocart(widget.food, widget.selectedAddon);
                Navigator.push(context, MaterialPageRoute(builder: (contex) {
                  return AIpage();
                }));
              },
              text: "Build with AI "),
          SizedBox(
            height: 15,
          ),
          Mybutton(
              ontap: () {
                addtocart(widget.food, widget.selectedAddon);
              },
              text: "Add to cart"),
          SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
