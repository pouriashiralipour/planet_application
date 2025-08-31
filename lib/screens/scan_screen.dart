import 'package:flutter/material.dart';
import 'package:planet_application/utils/size_config.dart';

import '../components/app_bar.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        right: () {},
        left: () {
          Navigator.of(context).pop();
        },
        leftIcon: Icons.close,
        rightIcon: Icons.share,
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
