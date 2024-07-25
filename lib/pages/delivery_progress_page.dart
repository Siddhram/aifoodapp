import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/my_recipt.dart';

class DelevaryProgressPage extends StatelessWidget {
  final String transactionId;
  final String date;
  final double amount;
  final String paymentMethod;

  DelevaryProgressPage({
    required this.transactionId,
    required this.date,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress..."),
      ),
      // bottomNavigationBar: buildBottomNavBar(context),
      body: Column(
        children: [
          MyRecipt(
            transactionId: transactionId ?? 'Unknown',
            date: date,
            amount: amount,
            paymentMethod: paymentMethod,
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 28.0, bottom: 28.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery boy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "driver",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      shape: BoxShape.circle),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
