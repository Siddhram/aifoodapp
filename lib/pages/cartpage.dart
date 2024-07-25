import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/my_carttile.dart';
import 'package:food/components/mybutton.dart';
import 'package:food/food/cart.dart';
import 'package:food/food/restarunt.dart';
import 'package:food/pages/paymentpage.dart';
import 'package:provider/provider.dart';
 cartlengthout(int val) {
  val1=val;
  // return val;
}
int val1=0;
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final usercart = restaurant.cart;
      void cartlength(){
        cartlengthout(usercart.length);
        // return usercart.length;
      }
      cartlength();
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 43.0),
            child: Text('Cart'),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you shure to delete the cart"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: Text("Yes")),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: restaurant.cart.isEmpty
            ? Center(child: Text("Empty cart"))
            : Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemCount: usercart.length,
                          itemBuilder: ((context, index) {
                            CartItem cartItem = usercart[index];

                            return MyCartTile(cartItem: cartItem);
                          }),
                        ))
                      ],
                    ),
                  ),
                  Mybutton(
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return PaymentPage();
                      })));
                    },
                    text: "Go to Checkout",
                  )
                ],
              ),
      );
    });
  }
}
