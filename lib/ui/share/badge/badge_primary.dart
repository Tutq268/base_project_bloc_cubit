import 'package:data_on/foundation/extension/number_formatting.dart';
import 'package:data_on/ui/resource/styles/app_colors.dart';
import 'package:data_on/ui/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgePrimary extends StatelessWidget {
  const BadgePrimary(
      {super.key, required this.title, this.bgColor, this.textColor});
  final String title;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: bgColor ?? AppColors.current.primaryColor),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.s14w400Primary()
                .copyWith(color: textColor ?? Colors.white),
          )
        ],
      ),
    );
  }
}
