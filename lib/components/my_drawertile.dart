// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawertile extends StatelessWidget {
  String text;
  IconData iconData;
  Function ontap;
  MyDrawertile({
    Key? key,
    required this.text,
    required this.iconData,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
          iconData,
          size: 25,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }
}
