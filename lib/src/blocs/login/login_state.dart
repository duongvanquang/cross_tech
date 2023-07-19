import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart'; // Import the generated file

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginStateInitial;
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.success() = LoginStateSuccess;
  const factory LoginState.error({required String massege}) = LoginStateError;
}
