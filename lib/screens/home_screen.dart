import 'package:flutter/material.dart';
import 'package:planet_application/models/plant_model.dart';
import 'package:planet_application/utils/persian_number.dart';

import '../utils/price_seperator.dart';
import '../utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoryList = ['پیشنهادی', 'آپارتمانی', 'محل‌کار', 'باغچه‌ایی', 'گلخانه ای'];
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;

  bool toggleFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(20),
                vertical: SizeConfig.getProportionateScreenHeight(10),
              ),
              child: Container(
                width: SizeConfig.screenWidth * 0.9,
                height: SizeConfig.screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: Color(0xFF296E48).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(18),
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.mic, size: SizeConfig.getProportionateScreenWidth(22)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: SizeConfig.getProportionateScreenWidth(22),
                    ),
                    suffixIconColor: Colors.grey[800],
                    prefixIconColor: Colors.grey[800],
                    hintText: 'جستجو ...',
                    hintStyle: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(18),
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(20),
                    vertical: SizeConfig.getProportionateScreenHeight(10),
                  ),
                  child: SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                    width: SizeConfig.screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.getProportionateScreenWidth(8),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Text(
                                '| ${categoryList[index]} |',
                                style: TextStyle(
                                  fontSize: selectedIndex == index
                                      ? SizeConfig.getProportionateScreenWidth(18)
                                      : SizeConfig.getProportionateScreenWidth(16),
                                  fontWeight: selectedIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.w300,
                                  color: selectedIndex == index
                                      ? Color(0xFF296E48)
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.getProportionateScreenWidth(16),
                          vertical: SizeConfig.getProportionateScreenHeight(10),
                        ),
                        width: SizeConfig.screenWidth * 0.55,
                        decoration: BoxDecoration(
                          color: Color(0xFF296E48).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: SizeConfig.getProportionateScreenHeight(10),
                              right: SizeConfig.getProportionateScreenWidth(20),
                              child: Container(
                                width: SizeConfig.getProportionateScreenWidth(40),
                                height: SizeConfig.getProportionateScreenWidth(40),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _plantList[index].isFavorated =
                                          !_plantList[index].isFavorated;
                                    });
                                  },
                                  icon: _plantList[index].isFavorated
                                      ? Icon(Icons.favorite_rounded)
                                      : Icon(Icons.favorite_outline_rounded),
                                  color: Color(0xFF296E48),
                                ),
                              ),
                            ),
                            Align(
                              child: Image.asset(
                                _plantList[index].imageURL,
                                height: SizeConfig.getProportionateScreenHeight(150),
                              ),
                            ),
                            Positioned(
                              bottom: SizeConfig.getProportionateScreenHeight(20),
                              left: SizeConfig.getProportionateScreenWidth(20),
                              child: Container(
                                width: SizeConfig.getProportionateScreenWidth(65),
                                height: SizeConfig.getProportionateScreenHeight(22),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  priceFormatter(_plantList[index].price.toString()).farsiNumber,
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    color: Color(0xFF296E48),
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.getProportionateScreenWidth(16),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: SizeConfig.getProportionateScreenHeight(15),
                              right: SizeConfig.getProportionateScreenWidth(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: SizeConfig.getProportionateScreenWidth(16),
                                    ),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: SizeConfig.getProportionateScreenWidth(18),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // new products
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(20),
                    vertical: SizeConfig.getProportionateScreenHeight(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          'گیاهان جدید',
                          style: TextStyle(
                            fontSize: SizeConfig.getProportionateScreenWidth(21),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lalezar',
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.3,
                        child: ListView.builder(
                          itemCount: _plantList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: SizeConfig.getProportionateScreenHeight(10),
                                top: SizeConfig.getProportionateScreenHeight(10),
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.getProportionateScreenWidth(10),
                                top: SizeConfig.getProportionateScreenHeight(10),
                              ),
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.getProportionateScreenHeight(90),
                              decoration: BoxDecoration(
                                color: Color(0xFF296E48).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: SizeConfig.getProportionateScreenWidth(80),
                                        height: SizeConfig.getProportionateScreenWidth(80),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF296E48).withValues(alpha: 0.8),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: SizeConfig.getProportionateScreenHeight(5),
                                        child: Image.asset(
                                          _plantList[index].imageURL,
                                          height: SizeConfig.getProportionateScreenHeight(82),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: SizeConfig.getProportionateScreenHeight(12),
                                        right: SizeConfig.getProportionateScreenWidth(100),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _plantList[index].category,
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                                fontSize: SizeConfig.getProportionateScreenWidth(
                                                  15,
                                                ),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              _plantList[index].plantName,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: SizeConfig.getProportionateScreenWidth(
                                                  18,
                                                ),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        priceFormatter(
                                          _plantList[index].price.toString(),
                                        ).farsiNumber,
                                        style: TextStyle(
                                          fontFamily: 'Lalezar',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF296E48),
                                          fontSize: SizeConfig.getProportionateScreenWidth(20),
                                        ),
                                      ),
                                      SizedBox(width: SizeConfig.getProportionateScreenWidth(5)),
                                      SizedBox(
                                        height: SizeConfig.getProportionateScreenHeight(20),
                                        child: Image.asset('assets/images/PriceUnit-green.png'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
