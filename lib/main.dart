import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'src/app_dependencies.dart';
import 'src/commonts/logger_utils.dart';

import 'src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _initApp();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('vi')],
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('vi'),
      path: 'assets/localizations',
      child: MyApp()));
}

Future<bool> _initApp() async {
  try {
    final bool appInit = await AppDependencies.appInit();
    if (!appInit) {
      return false;
    }
  } catch (ex) {
    LoggerUtils.e('cross_tech: ${ex.toString()}');
    return false;
  }
  return true;
}
