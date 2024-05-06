import 'package:data_on/data/enum/shared_enum.dart';
import 'package:data_on/foundation/constant/ui/ui_constants.dart';
import 'package:data_on/foundation/mixin/app_bloc_observer.dart';
import 'package:data_on/foundation/utils/device_utils.dart';
import 'package:data_on/foundation/utils/view_utils.dart';
import 'package:data_on/ui/config/app_initializer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/di.dart' as di;

class AppConfig extends ApplicationConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    Bloc.observer = AppBlocObserver();
    await ViewUtils.setPreferredOrientations(
        DeviceUtils.deviceType == DeviceType.mobile
            ? UiConstants.mobileOrientation
            : UiConstants.tabletOrientation);
    ViewUtils.setSystemUIOverlayStyle(UiConstants.systemUiOverlay);
  }
}
