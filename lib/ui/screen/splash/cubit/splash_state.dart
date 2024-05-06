import 'package:data_on/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState extends BaseState with _$SplashState {
  const factory SplashState({@Default(false) bool isLoading}) = _SplashState;
}
