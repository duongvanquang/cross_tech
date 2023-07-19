import 'package:firebase_auth/firebase_auth.dart';

import '../../commonts/base_cubit.dart';
import '../../helpers/string_helper.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this.auth) : super(const LoginState.initial());
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(String email, String password) async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(email) && StringHelper.isPassword(password)) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        emit(const LoginState.success());
      }
    } catch (e) {
      emit(const LoginState.error());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(email) && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        emit(const LoginState.success());
      }
    } catch (e) {
      emit(const LoginState.error());
    }
  }

  Future<String?> resetPassword(String email) async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(email)) {
        await auth.sendPasswordResetEmail(
          email: email.trim(),
        );
        emit(const LoginState.success());
      }
    } catch (e) {
      emit(const LoginState.error());
    }
    return null;
  }
}
