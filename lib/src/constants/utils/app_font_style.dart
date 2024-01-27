import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/constants/utils/app_assets.dart';

class KFontStyle {
  // KFontStyle._();

  static const h1Style = const TextStyle(
    fontSize: 60,
    color: Colors.white,
    fontFamily: 'Poppins',
    height: 1.4,
    fontWeight: FontWeight.w900,
  );

  static const h2Style = const TextStyle(
    fontSize: 22,
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const h3Style = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const h4Style = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const h5Style = const TextStyle(
    fontFamily: AppAssets.geist,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static final body1 = TextStyle(
    fontFamily: AppAssets.geist,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static final buttonBold = TextStyle(
    fontFamily: AppAssets.geist,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final textFieldStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.grey, width: 1),
  );
}
