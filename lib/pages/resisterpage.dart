// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/pages/homepage.dart';
import 'package:food/servises/auth/authservises.dart';

import '../components/mybutton.dart';
import '../components/textfield.dart';

class ResisterPage extends StatefulWidget {
  Function ontap;

  ResisterPage({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  State<ResisterPage> createState() => _ResisterPageState();
}

class _ResisterPageState extends State<ResisterPage> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController confirmpasswordcontroler = TextEditingController();
  void resister() async{
    final authservice=AuthSurvice();
    if (passwordcontroler.text==confirmpasswordcontroler.text) {
      try {
        await authservice.signUpwithemailandpassword(emailcontroler.text, passwordcontroler.text);
         Future.microtask(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      User? user=  authservice.getcurrentuser();
     

      } catch (e) {
        showDialog(context: context, builder: ((context) {
          return AlertDialog(
            title: Text(e.toString()),
          );
        }));
      }
    }
    else{
              showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text("password dont match"),
            );
          }));
    }
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
              'Lets Start Your Food Jorney',
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
              height: 20,
            ),
            MyTextfield(
                controller: confirmpasswordcontroler,
                hinttext: "Confirm Password",
                obsecure: true),
            SizedBox(
              height: 14,
            ),
            Mybutton(ontap: () {
              resister();
            }, text: "Sin up"),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account ? ",
                  style: TextStyle(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.ontap();
                      //LoginOrResister().togglepages();
                    });
                  },
                  child: Text("Log in ",
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
