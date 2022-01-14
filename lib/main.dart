import 'package:flutter/material.dart';

import 'core/init/cache/locale_manager.dart';
import 'view/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Carboy',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
