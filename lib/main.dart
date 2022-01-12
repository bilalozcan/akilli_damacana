import 'package:flutter/material.dart';

import 'view/splash/splash_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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