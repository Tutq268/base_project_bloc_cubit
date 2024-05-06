import 'package:bot_toast/bot_toast.dart';
import 'package:data_on/foundation/constant/ui/device_constants.dart';
import 'package:data_on/foundation/constant/ui/ui_constants.dart';
import 'package:data_on/ui/app_cubit.dart';
import 'package:data_on/ui/app_state.dart';
import 'package:data_on/ui/di/di.dart' as di;
import 'package:data_on/ui/resource/styles/app_themes.dart';
import 'package:data_on/ui/router/app_navigator_observer.dart';

import 'package:data_on/ui/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

final _appRouter = GetIt.instance.get<AppRouter>();
final _botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  bool get isAppWidget => true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(DeviceConstants.designDeviceWidth,
            DeviceConstants.designDeviceHeight),
        builder: (context, _) => BlocProvider(
              create: (context) => di.getIt.get<AppCubit>()..initData(),
              child: BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {
                  // ignore: todo
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state.isLoading == true) {
                    return Container();
                  }
                  return MaterialApp.router(
                    builder: (context, child) {
                      final MediaQueryData data = MediaQuery.of(context);
                      return _botToastBuilder(
                          context,
                          MediaQuery(
                            data: data.copyWith(
                                textScaler: const TextScaler.linear(1.0)),
                            child: child ?? const SizedBox.shrink(),
                          ));
                      // return MediaQuery(
                      //   data: data.copyWith(
                      //       textScaler: const TextScaler.linear(1.0)),
                      //   child: child ?? const SizedBox.shrink(),
                      // );
                    },
                    routerDelegate: _appRouter.delegate(
                      navigatorObservers: () => [AppNavigatorObserver()],
                    ),
                    locale: const Locale('vi'),
                    routeInformationParser: _appRouter.defaultRouteParser(),
                    title: UiConstants.materialAppTitle,
                    color: UiConstants.taskMenuMaterialAppColor,
                    themeMode: ThemeMode.light,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    debugShowCheckedModeBanner: false,
                  );
                },
              ),
            ));
  }

  // List<PageRouteInfo> _mapRouteToPageRouteInfo() {
  //   return widget.initialResource.initialRoutes.map<PageRouteInfo>((e) {
  //     switch (e) {
  //       case InitialAppRoute.login:
  //         return const LoginRoute();
  //       case InitialAppRoute.main:
  //         return const MainRoute();
  //     }
  //   }).toList(growable: false);
  // }
}
