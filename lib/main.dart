import 'package:flutter/material.dart';
import 'package:flutter_dark_theme/app_notifier.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: AppNotifier.themeNotifier1,
        builder: (context, themeMode, _) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeMode == 0 ? ThemeMode.light : ThemeMode.dark,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: const Home());
        });
  }
}
