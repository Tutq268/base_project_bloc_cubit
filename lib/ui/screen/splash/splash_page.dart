import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:data_on/data/model/account/account_model.dart';
import 'package:data_on/data/preference/app_preferences.dart';
import 'package:data_on/resource/generated/assets.gen.dart';
import 'package:data_on/ui/di/di.dart' as di;
import 'package:data_on/ui/navigation/app_navigator.dart';
import 'package:data_on/ui/navigation/app_route_info.dart';
import 'package:data_on/ui/resource/dimens/app_dimen.dart';
import 'package:data_on/ui/resource/dimens/dimens.dart';
import 'package:data_on/ui/resource/styles/app_colors.dart';
import 'package:data_on/ui/resource/styles/app_text_styles.dart';
import 'package:data_on/ui/screen/splash/cubit/splash_cubit.dart';
import 'package:data_on/ui/share/scaffold/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

//ignore_for_file: public_member_api_docs
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SplashCubit> {
  @override
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    navigator.push(const AppRouteInfo.main());
  }

  @override
  Widget buildPage(BuildContext context) {
    AppDimen.of(context);
    AppColors.of(context);
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash/splash_bg.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.splash.dataOnLogo.image(),
            Container(
              margin: EdgeInsets.only(top: Dimens.d16.responsive()),
              child: Text(
                "Bật DataOn, On không giới hạn",
                style: AppTextStyles.s16w600Primary()
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
