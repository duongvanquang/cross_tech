import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'src/my_app.dart';

Future<void> main() async {
  runApp(EasyLocalization(
      supportedLocales: const [Locale('vi')],
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('vi'),
      path: 'assets/localizations',
      child: const MyApp()));
}
