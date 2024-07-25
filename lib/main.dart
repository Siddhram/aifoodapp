// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/homepage.dart';
import 'package:food/pages/paymentpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food/firebase_options.dart';
import 'package:food/food/restarunt.dart';
import 'package:food/pages/login_page.dart';
import 'package:food/pages/resisterpage.dart';
import 'package:food/servises/auth/login_or_resiter.dart';
import 'package:food/themes/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
    final tokenExists = (token != null && token != '') ;

  runApp(MultiProvider(
    providers: [
      //theme
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      ChangeNotifierProvider(create: (context) => Restaurant()),

      //restarant
    ],
    child: MyApp(tokenExists: tokenExists,),
  ));
}
Future<bool> _checkTokenExists() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  return (token != null&&token!='');
}

class MyApp extends StatelessWidget {
    final bool tokenExists;

  MyApp({
    Key? key,
    required this.tokenExists,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Themeprovider>(context).themeData,
      // color: Colors.black,
      // home: PaymentPage(),
      home:tokenExists?HomePage(): LoginOrResister(),
    );
  }
}
