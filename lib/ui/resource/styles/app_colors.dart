// ignore_for_file: avoid_hard_coded_colors
import 'package:data_on/ui/resource/styles/app_themes.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryGradient,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  /// gradient
  final LinearGradient primaryGradient;
  static const defaultBackGroundColor = Color(0xfffaf7f8);

  static const defaultAppColor = AppColors(
    primaryColor: Color(0xffFB4145),
    secondaryColor: Color(0xff79767D),
    primaryTextColor: Color.fromARGB(255, 62, 62, 90),
    secondaryTextColor: Color(0xff666666),
    primaryGradient:
        LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 62, 62, 70),
    secondaryColor: Color.fromARGB(255, 166, 168, 254),
    primaryTextColor: Color.fromARGB(255, 166, 168, 254),
    secondaryTextColor: Color(0xffAFADB1),
    primaryGradient:
        LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    LinearGradient? primaryGradient,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
