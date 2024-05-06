import 'package:auto_route/auto_route.dart';
import 'package:data_on/ui/config/app_path.dart';
import 'package:data_on/ui/config/key.dart';
import 'package:data_on/ui/enum/bottom_tab_enum.dart';
import 'package:data_on/ui/router/app_navigator_impl.dart';
import 'package:data_on/ui/screen/main/cubit/main_cubit.dart';
import 'package:data_on/ui/share/scaffold/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage, MainCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: AutoTabsScaffold(
        routes: (navigator as AppNavigatorImpl).tabRoutes,
        scaffoldKey: AppKey.mainPageScaffoldKey,
        extendBody: true,
        floatingActionButton: InkWell(
          onTap: () {
            if ((navigator as AppNavigatorImpl).tabsRouter?.activeIndex == 2) {
              (navigator).popUntilRootOfCurrentBottomTab();
            }
            (navigator as AppNavigatorImpl).tabsRouter?.setActiveIndex(2);
          },
          child: Container(
            width: 60.w,
            height: 60.w,
            margin: EdgeInsets.only(bottom: 3.h, left: 5.w, right: 5.w),
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(60.r)),
              ),
              child: SizedBox(
                width: 22.w,
                height: 22.w,
                child: Image.asset(AppPath.bottomHome2),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBuilder: (_, tabsRouter) {
          (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;
          return BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5.0,
            elevation: 0,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.transparent,
                currentIndex: tabsRouter.activeIndex,
                selectedFontSize: 12.sp,
                selectedItemColor: const Color(0xffFB4145),
                onTap: (index) {
                  // if (index == 4) {
                  //   AppKey.mainPageScaffoldKey.currentState!.openDrawer();
                  // } else {
                  if (index == tabsRouter.activeIndex) {
                    (navigator).popUntilRootOfCurrentBottomTab();
                  }
                  tabsRouter.setActiveIndex(index);
                  // }
                },
                items: [
                  BottomNavigationBarItem(
                    label: BottomTab.values[0].title,
                    icon: Image.asset(
                      BottomTab.values[0].icon,
                      width: 30.w,
                      height: 30.w,
                    ),
                    activeIcon: Image.asset(
                      BottomTab.values[0].activeIcon,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: BottomTab.values[1].title,
                    icon: Image.asset(
                      BottomTab.values[1].icon,
                      width: 30.w,
                      height: 30.w,
                    ),
                    activeIcon: Image.asset(
                      BottomTab.values[1].activeIcon,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Trang chủ",
                    icon: SizedBox(
                      height: 30.w,
                      width: 30.w,
                    ),
                    activeIcon: SizedBox(
                      height: 30.w,
                      width: 30.w,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: BottomTab.values[3].title,
                    icon: Image.asset(
                      BottomTab.values[3].icon,
                      width: 30.w,
                      height: 30.w,
                    ),
                    activeIcon: Image.asset(
                      BottomTab.values[3].activeIcon,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: BottomTab.values[4].title,
                    icon: Image.asset(
                      BottomTab.values[4].icon,
                      width: 30.w,
                      height: 30.w,
                    ),
                    activeIcon: Image.asset(
                      BottomTab.values[4].activeIcon,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
