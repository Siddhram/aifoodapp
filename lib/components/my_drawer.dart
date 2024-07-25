import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/my_drawertile.dart';
import 'package:food/pages/seetings.dart';
import 'package:food/servises/auth/auth_gate.dart';
import 'package:food/servises/auth/authservises.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
void logout(){
  final authservice=AuthSurvice();
  authservice.signout();
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: 100,
              ),
              child: Icon(
                Icons.food_bank_rounded,
                size: 80,
              )),
          Padding(padding: EdgeInsets.all(30), child: Divider()),
          MyDrawertile(
              text: "Home",
              iconData: Icons.home,
              ontap: () {
                Navigator.pop(context);
              }),
          MyDrawertile(
              text: "Settings",
              iconData: Icons.settings,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              }),
          Spacer(),
          MyDrawertile(text: "LogOut", iconData: Icons.logout, ontap: () {
            logout();
          }),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
