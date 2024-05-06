import 'package:data_on/ui/app_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());
  Future<void> initData() async {
    try {} on DioException catch (e) {}
  }
}
