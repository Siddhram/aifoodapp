import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 20, 20, 20),
    primary: Color.fromARGB(255, 122, 122, 122),
    secondary: Color.fromARGB(255, 30, 30, 30),
    tertiary: Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
  ),
);
