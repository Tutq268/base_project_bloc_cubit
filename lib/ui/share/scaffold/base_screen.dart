import 'package:data_on/ui/di/di.dart' as di;
import 'package:data_on/ui/navigation/app_navigator.dart';
import 'package:data_on/ui/resource/dimens/app_dimen.dart';
import 'package:data_on/ui/resource/styles/app_colors.dart';
import 'package:data_on/ui/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen(
      {super.key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.elevation = 0.5,
      this.onPress,
      this.centerTitle = true,
      this.isSafeAreaTop = true,
      this.titleWidget,
      this.floatingActionButton,
      this.backgroundColor,
      this.titleColor});

  final String? title;
  final List<Widget>? trailing;
  final Widget? leading;
  final Widget child;
  final double? elevation;
  final Function()? onPress;
  final Widget? titleWidget;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool? centerTitle;
  final bool? isSafeAreaTop;
  final AppNavigator navigator = di.getIt.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    AppDimen.of(context);
    AppColors.of(context);
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.defaultBackGroundColor,
      appBar: title != null
          ? AppBar(
              backgroundColor:
                  backgroundColor ?? AppColors.defaultBackGroundColor,
              actions: trailing,
              leading: leading,
              automaticallyImplyLeading: leading != null ? true : false,
              elevation: elevation,
              centerTitle: centerTitle,
              title: Text(title!, style: AppTextStyles.s16w600Primary()))
          : null,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        top: isSafeAreaTop ?? true,
        child: GestureDetector(
          child: child,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}
