import 'package:flutter/material.dart';
import 'package:planet_application/screens/details_screen.dart';
import 'package:planet_application/utils/persian_number.dart';

import '../models/plant_model.dart';
import '../utils/price_seperator.dart';
import '../utils/size_config.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.favoritePlants});

  final List<Plant> favoritePlants;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favoritePlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/favorited.png',
                    height: SizeConfig.getProportionateScreenHeight(200),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                  Text(
                    'ظاهرا به هیچی علاقه نداشتی',
                    style: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(20),
                      color: Color(0xFF296E48),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(20)),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: ListView.builder(
                  itemCount: widget.favoritePlants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(id: widget.favoritePlants[index].plantId),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.getProportionateScreenWidth(20),
                        ),
                        child: Container(
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
                                      widget.favoritePlants[index].imageURL,
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
                                          widget.favoritePlants[index].category,
                                          style: TextStyle(
                                            color: Colors.grey[900],
                                            fontSize: SizeConfig.getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          widget.favoritePlants[index].plantName,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: SizeConfig.getProportionateScreenWidth(18),
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
                                      widget.favoritePlants[index].price.toString(),
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
