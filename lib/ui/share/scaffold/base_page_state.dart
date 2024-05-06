import 'package:data_on/foundation/mixin/log_mixin.dart';
import 'package:data_on/ui/app_cubit.dart';
import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/di/di.dart' as di;
import 'package:data_on/ui/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseCubit>
    extends BasePageStageDelegate<T, B> with LogMixin {}

abstract class BasePageStageDelegate<T extends StatefulWidget,
    B extends BaseCubit> extends State<T> {
  final AppNavigator navigator = di.getIt.get<AppNavigator>();
  final AppCubit appCubit = di.getIt.get<AppCubit>();

  late final B cubit = di.getIt.get<B>()
    ..navigator = navigator
    ..appCubit = appCubit;

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => navigator,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => cubit),
          ],
          child: buildPageListeners(child: buildPage(context)),
        ));
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPage(BuildContext context);
}
