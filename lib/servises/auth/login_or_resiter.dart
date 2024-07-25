import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/pages/login_page.dart';
import 'package:food/pages/resisterpage.dart';

class LoginOrResister extends StatefulWidget {
  const LoginOrResister({Key? key}) : super(key: key);

  @override
  State<LoginOrResister> createState() => _LoginOrResisterState();
}

class _LoginOrResisterState extends State<LoginOrResister> {
  bool showpage = true;
  void togglepages() {
    setState(() {
      showpage = !showpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showpage) {
      return Loginpage(ontap: togglepages);
    } else {
      return ResisterPage(ontap: togglepages);
    }
  }
}
