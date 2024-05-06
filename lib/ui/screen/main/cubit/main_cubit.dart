import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/main/cubit/main_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MainCubit extends BaseCubit<MainState> {
  MainCubit() : super(const MainState());
  Future<void> initData() async {
    try {} on DioException catch (e) {}
  }
}
