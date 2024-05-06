import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/home/cubit/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState());
  Future<void> initData() async {
    print("home page");
    try {} on DioException catch (e) {}
  }
}
