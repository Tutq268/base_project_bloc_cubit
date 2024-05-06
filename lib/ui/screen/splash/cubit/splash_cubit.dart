import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/splash/cubit/splash_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashState());
  Future<void> initData() async {
    try {} on DioException catch (e) {}
  }
}
