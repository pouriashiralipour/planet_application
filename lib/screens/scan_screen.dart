import 'package:flutter/material.dart';
import 'package:planet_application/utils/size_config.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.getProportionateScreenWidth(45),
              height: SizeConfig.getProportionateScreenWidth(45),
              decoration: BoxDecoration(
                color: Color(0xFF296E48).withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Color(0xFF296E48),
                  size: SizeConfig.getProportionateScreenWidth(20),
                ),
              ),
            ),
            Container(
              width: SizeConfig.getProportionateScreenWidth(45),
              height: SizeConfig.getProportionateScreenWidth(45),
              decoration: BoxDecoration(
                color: Color(0xFF296E48).withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Color(0xFF296E48),
                  size: SizeConfig.getProportionateScreenWidth(25),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/code-scan.png',
                height: SizeConfig.getProportionateScreenHeight(150),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              'برای اسکن گیاهان کلیک کنید',
              style: TextStyle(
                color: Color(0xFF296E48),
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.getProportionateScreenWidth(22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
