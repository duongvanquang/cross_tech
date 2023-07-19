import 'package:cross_tech/src/constances/assets_path.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_cubit.dart';
import '../blocs/login/login_state.dart';
import '../commonts/app_colors.dart';
import '../helpers/string_helper.dart';
import '../widgets/chose_login.dart';
import '../widgets/text_form_field_login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.bloc});
  final LoginCubit bloc;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = false;
  bool isPasswordValid = false;
  String textMail = '';
  String textPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.bloc,
      child: BlocBuilder(
        bloc: widget.bloc,
        builder: (context, LoginState state) {
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.paraColor,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    }),
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssetPath.logoSignup,
                      width: 350,
                    ),
                    const SizedBox(height: 10),
                    TextFormFeldLogin(
                      onChange: (value) {
                        setState(() {
                          isEmailValid = StringHelper.isEmail(value!);
                          textMail = value;
                        });
                      },
                      hintext: tr('login.hintex_email'),
                    ),
                    const SizedBox(height: 17),
                    TextFormFeldLogin(
                      isObscure: true,
                      onChange: (value) {
                        setState(() {
                          isPasswordValid = StringHelper.isPassword(value!);
                          textPassword = value;
                        });
                      },
                      hintext: tr('login.hintex_password'),
                    ),
                    const SizedBox(height: 25),
                    ChoseLogin(
                      color: (isEmailValid && isPasswordValid)
                          ? Colors.green
                          : Colors.grey,
                      width: MediaQuery.of(context).size.width / 1.9,
                      textButtonLogin: tr('login.button_signup'),
                      height: MediaQuery.of(context).size.height / 17,
                      ontap: (isEmailValid && isPasswordValid)
                          ? () {
                              widget.bloc.signup(textMail, textPassword);
                            }
                          : null,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
