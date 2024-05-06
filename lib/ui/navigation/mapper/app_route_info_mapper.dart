import 'package:auto_route/auto_route.dart';
import 'package:data_on/ui/navigation/app_route_info.dart';
import 'package:data_on/ui/navigation/base/base_route_info_mapper.dart';
import 'package:data_on/ui/router/router.gr.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      splash: () => const SplashRoute(),
    );
  }
}
