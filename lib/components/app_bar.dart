import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.rightIcon,
    required this.leftIcon,
    required this.right,
    required this.left,
  });

  final IconData rightIcon;
  final IconData leftIcon;
  final VoidCallback right;
  final VoidCallback left;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              onPressed: right,
              icon: Icon(
                rightIcon,
                color: Color(0xFF296E48),
                size: SizeConfig.getProportionateScreenWidth(25),
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
              onPressed: left,
              icon: Icon(
                leftIcon,
                color: Color(0xFF296E48),
                size: SizeConfig.getProportionateScreenWidth(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
