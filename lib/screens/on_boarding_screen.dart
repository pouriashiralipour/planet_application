import 'package:flutter/material.dart';
import 'package:planet_application/models/on_boarding_models.dart';

import '../utils/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  List<Widget> _buildIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < OnBoardingModels.onBoardingList.length; i++) {
      if (currentIndex == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(5)),
      duration: Duration(milliseconds: 400),
      width: isActive
          ? SizeConfig.getProportionateScreenWidth(20)
          : SizeConfig.getProportionateScreenWidth(10),
      height: 10,
      decoration: BoxDecoration(color: Color(0xFF296E48), borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextButton(
          onPressed: () {
            print('آخرین صفحه! وقتشه بریم صفحه اصلی.');
          },
          child: Text(
            'رد کردن',
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.getProportionateScreenWidth(16),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05),
        child: Stack(
          children: [
            PageView.builder(
              itemCount: OnBoardingModels.onBoardingList.length,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                final item = OnBoardingModels.onBoardingList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['image'],
                        height: SizeConfig.getProportionateScreenHeight(350),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                      Text(
                        item['title'],
                        style: TextStyle(
                          color: Color(0xFF296E48),
                          fontSize: SizeConfig.getProportionateScreenWidth(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.8,
                        child: Text(
                          item['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: SizeConfig.getProportionateScreenHeight(40),
              left: SizeConfig.getProportionateScreenWidth(20),
              child: Row(children: _buildIndicator()),
            ),
            Positioned(
              bottom: SizeConfig.getProportionateScreenHeight(30),
              right: SizeConfig.getProportionateScreenWidth(20),
              child: GestureDetector(
                onTap: () {
                  if (currentIndex == OnBoardingModels.onBoardingList.length - 1) {
                    print('آخرین صفحه! وقتشه بریم صفحه اصلی.');
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.getProportionateScreenWidth(50),
                  height: SizeConfig.getProportionateScreenHeight(50),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF296E48)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: SizeConfig.getProportionateScreenWidth(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
