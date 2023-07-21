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
  Future<void> signup(String email, String password) async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(email) && StringHelper.isPassword(password)) {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
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

  Future<void> signIn(String email, String password) async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(email) && password.isNotEmpty) {
        final userLogin = await auth.signInWithEmailAndPassword(
            email: email, password: password);
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
      emit(LoginState.error(massege: tr('login.error_email')));
    }
    return null;
  }
}
