import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/service/cubit/service_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ServiceCubit extends BaseCubit<ServiceState> {
  ServiceCubit() : super(const ServiceState());
  Future<void> initData() async {
    print("123123");
    try {} on DioException catch (e) {}
  }
}
