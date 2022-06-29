import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:memory_game/screens/home_page/view/home_page_view.dart';
import 'package:memory_game/core/constants/constants.dart' as constants;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: constants.localizationUrl,
      supportedLocales: const [Locale('tr'), Locale('en')],
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      home: const HomePage(),
    );
  }
}
