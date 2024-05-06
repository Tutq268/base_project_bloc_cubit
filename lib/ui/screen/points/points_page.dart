import 'package:auto_route/auto_route.dart';
import 'package:data_on/ui/resource/dimens/app_dimen.dart';
import 'package:data_on/ui/resource/dimens/dimens.dart';
import 'package:data_on/ui/screen/points/cubit/points_cubit.dart';
import 'package:data_on/ui/screen/points/cubit/points_state.dart';
import 'package:data_on/ui/share/loading/common_loading.dart';
import 'package:data_on/ui/share/scaffold/base_page_state.dart';
import 'package:data_on/ui/share/scaffold/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PointsPage extends StatefulWidget {
  const PointsPage({super.key});

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends BasePageState<PointsPage, PointsCubit> {
  @override
  void initState() {
    cubit.initData();
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return BaseScreen(
        isSafeAreaTop: false,
        child: BlocConsumer<PointsCubit, PointsState>(
            listener: (context, state) {},
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
            }));
  }
}
