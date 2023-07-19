import 'dart:async';

import 'package:cross_tech/src/pages/signup_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constances/assets_path.dart';
import '../helpers/string_helper.dart'; // Import the StringHelper class
import '../widgets/chose_login.dart';
import '../widgets/text_form_field_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamController<bool> broadcastStreamController =
      StreamController<bool>.broadcast();
  @override
  void dispose() {
    broadcastStreamController.close();
    super.dispose();
  }

  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('login.title'),
                  style: const TextStyle(fontSize: 30, color: Colors.black45),
                ),
                const SizedBox(height: 4),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.black12,
                            offset: Offset(0, 1))
                      ]),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(310, 10, 20, 10),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black12,
                                    offset: Offset(0, 1)),
                              ]),
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                tr('login.title_login'),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 3,
                                    leadingDistribution:
                                        TextLeadingDistribution.even),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              ChoseLogin(
                                ontap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()),
                                  );
                                },
                                color: Colors.red,
                                width: MediaQuery.of(context).size.width / 1.4,
                                textButtonLogin: tr('login.title_google'),
                                image: ImageAssetPath.imageGoogle,
                                height: MediaQuery.of(context).size.height / 17,
                              ),
                              const SizedBox(height: 25),
                              ChoseLogin(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width / 1.4,
                                textButtonLogin: tr('login.title_apple'),
                                image: ImageAssetPath.imageApple,
                                height: MediaQuery.of(context).size.height / 17,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                tr('login.space'),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 20),
                              TextFormFeldLogin(
                                isObscure: false,
                                onChange: (value) {
                                  setState(() {
                                    isEmailValid = StringHelper.isEmail(value!);
                                  });
                                },
                                hintext: tr('login.hintex_email'),
                              ),
                              const SizedBox(height: 17),
                              TextFormFeldLogin(
                                isObscure: true,
                                onChange: (value) {
                                  setState(() {
                                    isPasswordValid =
                                        StringHelper.isPassword(value!);
                                  });
                                },
                                hintext: tr('login.hintex_password'),
                              ),
                              const SizedBox(height: 25),
                              StreamBuilder<bool>(
                                stream: broadcastStreamController.stream,
                                builder: (context, snapshot) {
                                  final isValid =
                                      isEmailValid && isPasswordValid;
                                  return ChoseLogin(
                                    color: isValid ? Colors.green : Colors.grey,
                                    width:
                                        MediaQuery.of(context).size.width / 1.9,
                                    textButtonLogin: tr('login.button_login'),
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    ontap: isValid
                                        ? () {
                                            broadcastStreamController.sink
                                                .add(true);
                                          }
                                        : null,
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                              Text(
                                tr('login.forgot_password'),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tr('login.no_password'),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    tr('login.create_password'),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
