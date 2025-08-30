import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:planet_application/screens/cart_screen.dart';
import 'package:planet_application/screens/favorite_screen.dart';
import 'package:planet_application/screens/home_screen.dart';
import 'package:planet_application/screens/profile_screen.dart';
import 'package:planet_application/screens/scan_screen.dart';

import '../utils/size_config.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<String> appBarTitle = ['خانه', 'علاقه مندی ها', 'سبد خرید', 'پروفایل'];
  int bottonIndex = 0;
  List<IconData> iconsList = [Icons.home, Icons.favorite, Icons.shopping_cart, Icons.people];
  List<Widget> screens = [HomeScreen(), FavoriteScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appBarTitle[bottonIndex],
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                fontSize: SizeConfig.getProportionateScreenWidth(25),
              ),
            ),
            Icon(
              Icons.notifications,
              size: SizeConfig.getProportionateScreenWidth(25),
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: SizeConfig.getProportionateScreenWidth(65),
        width: SizeConfig.getProportionateScreenWidth(65),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanScreen()));
          },
          backgroundColor: Color(0xFF296E48),
          shape: const CircleBorder(),
          child: Image.asset(
            'assets/images/code-scan-two.png',
            height: SizeConfig.getProportionateScreenWidth(38),
            width: SizeConfig.getProportionateScreenWidth(38),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        elevation: 3,
        blurEffect: true,
        shadow: Shadow(color: Colors.grey, blurRadius: 10),
        itemCount: screens.length,
        tabBuilder: (index, isActive) {
          return Icon(
            iconsList[index],
            size: isActive
                ? SizeConfig.getProportionateScreenWidth(32)
                : SizeConfig.getProportionateScreenWidth(25),
            color: isActive ? Color(0xFF296E48) : Colors.grey,
          );
        },

        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeIndex: bottonIndex,
        onTap: (index) => setState(() => bottonIndex = index),
      ),
    );
  }
}
