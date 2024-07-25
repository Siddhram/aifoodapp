// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/servises/auth/authservises.dart';
import 'package:food/servises/auth/login_or_resiter.dart';

import 'package:food/components/mybutton.dart';
import 'package:food/components/textfield.dart';
import 'package:food/pages/homepage.dart';

class Loginpage extends StatefulWidget {
  Function ontap;
  Loginpage({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
void login() async{
  final authservice=AuthSurvice();
  try {
    await authservice.signinwithemailandpassword(emailcontroler.text, passwordcontroler.text);
    Future.microtask(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
  } catch (e) {
     showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text(e.toString()),
            );
          }));
  }
// token hll3UStRtlQeMwXs6dmKHsklkmy1
      // hll3UStRtlQeMwXs6dmKHsklkmy1
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 72,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Food delivery app',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
                controller: emailcontroler, hinttext: "Email", obsecure: false),
            SizedBox(
              height: 20,
            ),
            MyTextfield(
                controller: passwordcontroler,
                hinttext: "Password",
                obsecure: true),
            SizedBox(
              height: 14,
            ),
            Mybutton(
                ontap: () {
                  login();
                   
                },
                text: "Sin in"),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "not a member ? ",
                  style: TextStyle(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    // Deferred call to setState to avoid building during build phase
                    //  Future.delayed(Duration.zero, () {
                    // setState(() {
                    widget.ontap();
                    // });
                    // });
                  },
                  child: Text("Create Account ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
