import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.secondary)
                .copyWith(color: Colors.grey.shade300),
            margin: EdgeInsets.only(top: 10, left: 25, right: 25),
            padding: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary)
                      .copyWith(color: Colors.black),
                ),
                CupertinoSwitch(
                    value: Provider.of<Themeprovider>(context, listen: false)
                        .isDarkmode,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Themeprovider>(context, listen: false)
                            .togel();
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
