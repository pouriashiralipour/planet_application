import 'package:flutter/material.dart';
import 'package:planet_application/components/app_bar.dart';
import 'package:planet_application/models/plant_model.dart';
import 'package:planet_application/utils/persian_number.dart';
import 'package:planet_application/utils/price_seperator.dart';
import 'package:planet_application/utils/size_config.dart';

import '../components/plant_specifications.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Plant> addCart = [];

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final plant = Plant.plantList[widget.id];
    return Scaffold(
      appBar: CustomAppBar(
        rightIcon: plant.isFavorated ? Icons.favorite : Icons.favorite_outline,
        leftIcon: Icons.close,
        right: () {
          setState(() {
            plant.isFavorated = !plant.isFavorated;
          });
        },
        left: () {
          Navigator.of(context).pop();
        },
      ),
      body: Stack(
        children: [
          Positioned(
            left: SizeConfig.getProportionateScreenWidth(30),
            bottom: SizeConfig.screenHeight * 0.4,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                plant.imageURL,
                height: SizeConfig.getProportionateScreenHeight(360),
              ),
            ),
          ),
          Positioned(
            right: SizeConfig.getProportionateScreenWidth(20),
            top: SizeConfig.screenHeight * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Specifications(plant: plant, keyText: 'اندازه گیاه', valueText: plant.size),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
                Specifications(
                  plant: plant,
                  keyText: 'رطوبت هوا',
                  valueText: plant.humidity.toString().farsiNumber,
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
                Specifications(
                  plant: plant,
                  keyText: 'دمای نگهداری',
                  valueText: plant.temperature.farsiNumber,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(80),
                right: SizeConfig.getProportionateScreenWidth(20),
                left: SizeConfig.getProportionateScreenWidth(20),
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFF296E48).withValues(alpha: 0.45),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.plantName,
                    style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: SizeConfig.getProportionateScreenWidth(30),
                      color: Color(0xFF296E48),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            priceFormatter(plant.price.toString()).farsiNumber,
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: SizeConfig.getProportionateScreenWidth(21),
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: SizeConfig.getProportionateScreenWidth(10)),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                            child: Image.asset('assets/images/PriceUnit-green.png'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            plant.rating.toString().farsiNumber,
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: SizeConfig.getProportionateScreenWidth(24),
                              color: Color(0xFF296E48),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: SizeConfig.getProportionateScreenWidth(25),
                            color: Color(0xFF296E48),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                  Text(
                    plant.decription,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(16),
                      color: Colors.black.withValues(alpha: 0.7),
                      height: SizeConfig.getProportionateScreenHeight(1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: SizeConfig.screenWidth * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth * 0.7,
              height: SizeConfig.getProportionateScreenHeight(45),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF296E48),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                onPressed: () {
                  setState(() {
                    bool isSelected = toggleIsSelected(plant.isSelected);
                    plant.isSelected = isSelected;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        plant.isSelected ? 'آیتم به سبد خرید اضافه شد' : 'آیتم از سبد خرید حذف شد',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: plant.isSelected ? Color(0xFF296E48) : Colors.redAccent,
                    ),
                  );
                },
                child: Text(
                  plant.isSelected ? 'اضافه شد' : 'افزودن به سبد خرید',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: SizeConfig.getProportionateScreenWidth(18),
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.getProportionateScreenWidth(50),
              height: SizeConfig.getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: Color(0xFF296E48).withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  plant.isSelected ? Icons.shopping_cart_checkout : Icons.shopping_cart,
                  size: SizeConfig.getProportionateScreenWidth(25),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
