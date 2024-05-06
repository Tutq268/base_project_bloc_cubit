import 'package:data_on/ui/config/app_path.dart';

enum BottomTab {
  service(icon: AppPath.bottomService, activeIcon: AppPath.bottomServiceActive),
  myPackage(
      icon: AppPath.bottomMyPackage, activeIcon: AppPath.bottomMyPackageActive),
  home(icon: AppPath.bottomHome, activeIcon: AppPath.bottomHome),
  points(icon: AppPath.bottomPoints, activeIcon: AppPath.bottomPointsActive),
  accountBalance(
      icon: AppPath.bottomSupport, activeIcon: AppPath.bottomSupportActive),
  ;

  const BottomTab({
    required this.icon,
    required this.activeIcon,
  });
  final String icon;
  final String activeIcon;

  String get title {
    switch (this) {
      case BottomTab.service:
        return "Dịch vụ";
      case BottomTab.myPackage:
        return "Gói của tôi";
      case BottomTab.home:
        return "Trang chủ";
      case BottomTab.points:
        return "Tích điểm";
      case BottomTab.accountBalance:
        return "Hỗ trợ";
    }
  }
}
