// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:food/food/foodclass.dart';
import 'package:food/themes/theme_provider.dart';

class MyQuantitySelector extends StatefulWidget {
  int quantity;
  Food food;
  final Function increment;
  final Function decrement;
  MyQuantitySelector({
    Key? key,
    required this.quantity,
    required this.food,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  State<MyQuantitySelector> createState() => _MyQuantitySelectorState();
}

class _MyQuantitySelectorState extends State<MyQuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),

      padding: EdgeInsets.all(3),
      // margin: EdgeInsets.all(2),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.decrement();
              });
            },
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(child: Text(widget.quantity.toString())),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.increment();
              });
            },
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
