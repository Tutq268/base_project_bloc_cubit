import 'package:auto_route/auto_route.dart';
import 'package:data_on/ui/di/di.dart' as di;
import 'package:data_on/ui/resource/dimens/app_dimen.dart';
import 'package:data_on/ui/resource/dimens/dimens.dart';
import 'package:data_on/ui/screen/my_package/cubit/my_package_cubit.dart';
import 'package:data_on/ui/screen/my_package/cubit/my_package_state.dart';
import 'package:data_on/ui/share/loading/common_loading.dart';
import 'package:data_on/ui/share/scaffold/base_page_state.dart';
import 'package:data_on/ui/share/scaffold/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyPackagePage extends StatefulWidget {
  const MyPackagePage({super.key});

  @override
  State<MyPackagePage> createState() => _MyPackagePageState();
}

class _MyPackagePageState extends BasePageState<MyPackagePage, MyPackageCubit> {
  @override
  void initState() {
    cubit.initData();
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return BaseScreen(
      title: "Gói cước của tôi",
      child: BlocBuilder<MyPackageCubit, MyPackageState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.d32.h),
                child: CommonLoading(
                    containerHeight: Dimens.d42.responsive(),
                    containerWidth: Dimens.d42.responsive()),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
