import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTextStyles {
  static const TextStyle categoryTextStyle = TextStyle(
    fontFamily: "Roboto-Bold",
    color: AppColors.purple,
    fontSize: 12.0,
  );
  static const TextStyle mainTextStyle = TextStyle(
    fontFamily: "Roboto-Bold",
    color: AppColors.purple,
    fontWeight: FontWeight.w700,
    fontSize: 25.0,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.brown,
    fontSize: 15.0,
  );
  static const TextStyle searchFieldStyle = TextStyle(
    fontFamily: "Roboto-Bold",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    fontSize: 12.0,
  );
}
