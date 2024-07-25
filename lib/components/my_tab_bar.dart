// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/food/foodclass.dart';

class MyTabbar extends StatelessWidget {
  TabController tabController;
  MyTabbar({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  List<Tab> buildcategorytab() {
    return FoodCategory.values.map((category) {
      return Tab(
        
        text: category.toString().split('.').last,
        
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabController, tabs: buildcategorytab()),
    );
  }
}
