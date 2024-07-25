import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/themes/darrkmode.dart';
import 'package:food/themes/lightmode.dart';

class Themeprovider with ChangeNotifier {
  ThemeData themeData = lightmode;
  ThemeData get themedata => themeData;
  bool get isDarkmode => themeData == darkmode;
  set setthemedata(ThemeData themedat) {
    themeData = themedat;
    notifyListeners();
  }

  void togel() {
    if (themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
    notifyListeners();
  }
}
