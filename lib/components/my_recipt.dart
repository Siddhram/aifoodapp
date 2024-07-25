import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/food/restarunt.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyRecipt extends StatelessWidget {
  final String transactionId;
  final String date;
  final double amount;
  final String paymentMethod;

  MyRecipt({
    required this.transactionId,
    required this.date,
    required this.amount,
    required this.paymentMethod,
  });
  TimeExample example = TimeExample();
  String func(String a) {
    List<String> list = a.split(':');
    a.replaceAll(a[1], (int.parse(a[1]) + 20).toString());
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Column(
            children: [
              Text("Thank you for Your order "),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(25),
                child: Consumer<Restaurant>(
                    builder: ((context, restaurant, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Receipt',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text('Transaction ID: $transactionId'),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Date: $date'),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Amount: \$${amount.toStringAsFixed(2)}'),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Payment Method: $paymentMethod'),
                      SizedBox(height: 32),
                      Text(restaurant.displayCartRecipt()),
                    ],
                  );
                })),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                  "Estimate delivery time is ${example.formattedTime} See you soon "),
              SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeExample {
  String formattedTime;

  // Constructor initializes formattedTime
  TimeExample() : formattedTime = _getFormattedFutureTime() {
    // Additional initialization code (if needed)
  }

  // Static method to get the formatted time
  static String _getFormattedFutureTime() {
    DateTime now = DateTime.now();
    DateTime futureTime = now.add(Duration(minutes: 20));
    return DateFormat('hh:mm:ss a').format(futureTime);
  }
}
