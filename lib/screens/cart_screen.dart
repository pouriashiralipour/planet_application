import 'package:flutter/material.dart';
import 'package:planet_application/utils/persian_number.dart';

import '../models/plant_model.dart';
import '../utils/price_seperator.dart';
import '../utils/size_config.dart';
import 'details_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.addedTocart});

  final List<Plant> addedTocart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int calculateTotalPrice() {
    int totalPrice = 0;
    totalPrice = widget.addedTocart.fold(0, (sum, item) => sum + item.price);

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addedTocart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/add-cart.png',
                    height: SizeConfig.getProportionateScreenHeight(200),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                  Text(
                    'سبد خرید تار عنکبوت بسته',
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
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.addedTocart.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(id: widget.addedTocart[index].plantId),
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
                                            widget.addedTocart[index].imageURL,
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
                                                widget.addedTocart[index].category,
                                                style: TextStyle(
                                                  color: Colors.grey[900],
                                                  fontSize: SizeConfig.getProportionateScreenWidth(
                                                    15,
                                                  ),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                widget.addedTocart[index].plantName,
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
                                            widget.addedTocart[index].price.toString(),
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getProportionateScreenWidth(15),
                      ),
                      height: SizeConfig.screenHeight * 0.1,
                      width: SizeConfig.screenWidth * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'جمع کل',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lalezar',
                              fontSize: SizeConfig.getProportionateScreenWidth(20),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                priceFormatter(calculateTotalPrice().toString()).farsiNumber,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF296E48),
                                  fontSize: SizeConfig.getProportionateScreenWidth(21),
                                ),
                              ),
                              SizedBox(width: SizeConfig.getProportionateScreenWidth(5)),
                              Image.asset(
                                'assets/images/PriceUnit-green.png',
                                height: SizeConfig.getProportionateScreenHeight(20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                  ],
                ),
              ),
            ),
    );
  }
}
