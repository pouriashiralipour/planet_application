import 'package:flutter/material.dart';
import 'package:planet_application/models/plant_model.dart' show Plant;

import '../utils/size_config.dart';

class Specifications extends StatelessWidget {
  const Specifications({
    super.key,
    required this.plant,
    required this.keyText,
    required this.valueText,
  });

  final Plant plant;
  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          keyText,
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: SizeConfig.getProportionateScreenWidth(21),
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          valueText,
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: SizeConfig.getProportionateScreenWidth(21),
            color: Color(0xFF296E48),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
