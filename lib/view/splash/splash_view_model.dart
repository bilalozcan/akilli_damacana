import 'package:flutter/material.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/view/login/login_view.dart';

class SplashViewModel extends CustomBaseViewModel {
  @override
  void initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
  }

}