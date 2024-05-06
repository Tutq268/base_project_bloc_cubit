// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/my_package/cubit/my_package_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MyPackageCubit extends BaseCubit<MyPackageState> {
  MyPackageCubit() : super(const MyPackageState());

  Future<void> initData() async {
    print("my package cubit");
    try {} on DioException catch (e) {}
  }
}
