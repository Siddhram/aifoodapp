// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:food/food/foodclass.dart';

class MyFoodTile extends StatelessWidget {
  Food food;
  Function ontap;
  MyFoodTile({
    Key? key,
    required this.food,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            ontap();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text detail
                  Text(
                    food.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " ₹ " + food.price.toString(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(food.discription),
                ],
              )),
              SizedBox(
                width: 13,
              ),
              //food image
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
                child: Image.asset(
                  food.imagepath,
                  height: 100,
                  width: 100, // You can set the width as needed
                  fit: BoxFit.cover, // Adjust the fit property
                ),
              ),
            ]),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          indent: 25,
          endIndent: 25,
        )
      ],
    );
  }
}
