import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:food/components/mybutton.dart';
import 'package:food/food/restarunt.dart';
import 'package:food/pages/delivery_progress_page.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // void userstappedpay() {
  //   if (formKey.currentState!.validate()) {
  //     showDialog(
  //         context: context,
  //         builder: ((context) {
  //           return AlertDialog(
  //             title: Text("Confirm Payment"),
  //             content: SingleChildScrollView(
  //               /*
  //               'name': _nameController.text,
  //                   'description': _descriptionController.text,
  //                   'prefill': {
  //                     'contact': _contactController.text,
  //                     'email': _emailController.text,
  //                   }, */
  //               child: ListBody(children: [
  //                 Text("name : " + _nameController.text),
  //                 Text("description : " + _descriptionController.text),
  //                 Text("contact : " + _contactController.text),
  //                 Text("email : " + _emailController.text),
  //               ]),
  //             ),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text("Cancel")),
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);

  //                     Navigator.push(context,
  //                         MaterialPageRoute(builder: (context) {
  //                       return DelevaryProgressPage();
  //                     }));
  //                   },
  //                   child: Text("Yes")),
  //             ],
  //           );
  //         }));
  //   }
  // }
  Razorpay _razorpay = Razorpay();
int val=0;
  @override
  Widget build(BuildContext context) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Consumer<Restaurant>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            title: Text("Cheakout"),
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                   child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Payment Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _contactController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Contact',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your contact number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
                Mybutton(
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the form data
                        double totalCartPrize =
                            double.parse(value.getTotalCartPrize().toString());
                        int totalCartPrizeAsInt = totalCartPrize.round();
                        setState(() {
                          val=totalCartPrizeAsInt;
                        });
                        final formData = {
                          'key': 'rzp_test_GcZZFDPP0jHtC4',
                          'amount': totalCartPrizeAsInt * 100,
                          'name': _nameController.text,
                          'description': _descriptionController.text,
                          'prefill': {
                            'contact': _contactController.text,
                            'email': _emailController.text,
                          },
                        };

                        _razorpay.open(formData);

                        print(formData);
                      }
                      // userstappedpay();
                    },
                    text: "Pay now"),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Sucsess");
    /*
     ReceiptPage(
        transactionId: response.paymentId ?? 'Unknown',
        date: DateTime.now().toString(),
        amount: double.parse(value.getTotalCartPrize().toString()),
        paymentMethod: 'Razorpay',
      ),
    */
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return DelevaryProgressPage(
         transactionId: response.paymentId.toString() ?? 'unknown',
        date: DateTime.now().toString(),
        amount: double.parse(val.toString()),
        paymentMethod: 'Razorpay',
      );
    })));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Navigator.pop(context);

    print("payment faile");

    // Fluttertoast.showToast(msg: "payment failed");

    // Do something when payment fails
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }
}
