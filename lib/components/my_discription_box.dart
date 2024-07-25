import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDiscriptionBox extends StatelessWidget {
  const MyDiscriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myprimaryTextstyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    var mysecondaryTextstyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                '\$0.99',
                style: myprimaryTextstyle,
              ),
              Text(
                'Delivery fee',
                style: mysecondaryTextstyle,
              )
            ],
          ),
          Column(
            children: [
              Text(
                '15-20 min',
                style: myprimaryTextstyle,
              ),
              Text(
                'Delivery Time',
                style: mysecondaryTextstyle,
              )
            ],
          )
        ]),
      ),
    );
  }
}
