import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({Key? key}) : super(key: key);
  void openlocationsearchbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Your Location'),
              content: TextField(
                decoration: InputDecoration(hintText: "Address..."),
              ),
              actions: [
                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'),
                ),
                MaterialButton(
                  color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('save'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now"),
          GestureDetector(
            onTap: () {
              openlocationsearchbox(context);
            },
            child: Row(
              children: [
                Text(
                  "solapur anywhere",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
