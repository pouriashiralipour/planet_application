import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Container(
              width: SizeConfig.getProportionateScreenWidth(120),
              height: SizeConfig.getProportionateScreenWidth(120),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(
                  color: Color(0xFF296E48).withValues(alpha: 0.5),
                  width: SizeConfig.getProportionateScreenWidth(3),
                ),
              ),
              child: CircleAvatar(backgroundImage: AssetImage('assets/images/profile.jpg')),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/verified.png',
                  height: SizeConfig.getProportionateScreenHeight(22),
                ),
                SizedBox(width: SizeConfig.getProportionateScreenWidth(5)),
                Text(
                  'پوریا شیرالی پور',
                  style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(21),
                    fontWeight: FontWeight.w300,
                    color: Colors.black54.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              'impoush@gmail.com',
              style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(21),
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            ProfileListTile(title: 'پروفایل من', icon: Icons.person),
            ProfileListTile(title: 'تنظیمات', icon: Icons.settings),
            ProfileListTile(title: 'اطلاع رسانی', icon: Icons.notifications),
            ProfileListTile(title: 'شبکه های اجتماعی', icon: Icons.share),
            ProfileListTile(title: 'خروج', icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(17),
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        leading: Icon(
          icon,
          size: SizeConfig.getProportionateScreenWidth(28),
          color: Colors.grey[700],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: SizeConfig.getProportionateScreenWidth(20),
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
