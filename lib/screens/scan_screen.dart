import 'package:flutter/material.dart';
import 'package:planet_application/utils/size_config.dart';
import '../components/app_bar.dart';
import 'barcode_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isScanMode = false;

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
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BarcodeScreen()),
                  );
                });
              },
              child: Image.asset(
                'assets/images/code-scan.png',
                height: SizeConfig.getProportionateScreenHeight(150),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Text(
              'برای اسکن گیاه کلیک کنید',
              style: TextStyle(
                fontFamily: 'Lalezar',
                color: Color(0xFF296E48),
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.getProportionateScreenWidth(26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
