import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/login/cubit/login_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());
  Future<void> initData() async {
    try {} on DioException catch (e) {}
  }
}
