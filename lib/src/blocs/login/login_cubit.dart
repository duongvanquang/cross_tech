import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../commonts/base_cubit.dart';
import '../../helpers/string_helper.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
  FirebaseAuth auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  Future<void> signup() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email) &&
          StringHelper.isPassword(_password) &&
          _password == _confirmPassword) {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user.user != null) {
          emit(const LoginState.success());
        } else {
          emit(LoginState.error(massege: tr('login.error_email')));
        }
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<void> signIn() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email) && _password.isNotEmpty) {
        final userLogin = await auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (userLogin.user != null) {
          emit(const LoginState.success());
        } else {
          emit(LoginState.error(massege: tr('login.error_email')));
        }
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<void> signInWithApple() async {
    try {
      emit(const LoginState.loading());
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: 'de.lunaone.flutter.signinwithappleexample.service',
            redirectUri: kIsWeb
                ? Uri.parse('')
                : Uri.parse(
                    'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
                  )),
        nonce: 'example-nonce',
        state: 'example-state',
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        OAuthCredential(
          providerId: 'apple.com',
          signInMethod: 'oauth',
          accessToken: credential.identityToken,
          idToken: credential.identityToken,
          rawNonce: 'example-nonce', // Should be the same as nonce above
        ),
      );

      if (userCredential.user != null) {
        emit(const LoginState.success());
      } else {
        emit(LoginState.error(massege: tr('login.error_email')));
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<String?> resetPassword() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email)) {
        await auth.sendPasswordResetEmail(
          email: _email.trim(),
        );
        emit(const LoginState.success());
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
    return null;
  }
}
