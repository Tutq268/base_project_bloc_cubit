import 'package:data_on/ui/cubit/base_cubit.dart';
import 'package:data_on/ui/screen/points/cubit/points_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

const assetKey = 'assets/data/points/points_data.json';

@Injectable()
class PointsCubit extends BaseCubit<PointsState> {
  PointsCubit() : super(const PointsState());
  Future<void> initData() async {
    print("point page");
    try {} on DioException catch (e) {}
  }
}
