// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/my_current_location.dart';
import 'package:food/components/my_discription_box.dart';
import 'package:food/components/my_drawer.dart';
import 'package:food/components/my_foodtile.dart';
import 'package:food/components/my_sliverappbar.dart';
import 'package:food/components/my_tab_bar.dart';
import 'package:food/food/foodclass.dart';
import 'package:food/food/restarunt.dart';
import 'package:food/pages/foodpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Food> filterfoodmenueCategory(
      FoodCategory category, List<Food> fullmenue) {
    return fullmenue.where((food) => food.foodCategory == category).toList();
  }

  List<Widget> getfoodofthethiscategory(List<Food> fullmenue) {
//perticular category food seperated
    return FoodCategory.values.map((category) {
      List<Food> categoryMenue = filterfoodmenueCategory(category, fullmenue);
      return ListView.builder(
          itemCount: categoryMenue.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            //getting individual food
            final food = categoryMenue[index];
            return MyFoodTile(
                food: food,
                ontap: () {
                  Future.microtask(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodPage(
                                food: food,
                              )),
                    );
                  });
                });
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabbar(tabController: tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                MyCurrentLocation(),
                MyDiscriptionBox()
              ],
            ),
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
                controller: tabController,
                children: getfoodofthethiscategory(restaurant.menue));
          },
        ),
      ),
    );
  }
}
