import 'package:flutter/material.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/core/constants/enum/locale_enum.dart';
import 'package:smart_carboy/core/extensions/locale_extension.dart';
import 'package:smart_carboy/core/init/cache/locale_manager.dart';
import 'package:smart_carboy/view/login/login_view.dart';
import 'package:smart_carboy/view/main/main_view.dart';

class SplashViewModel extends CustomBaseViewModel {
  @override
  void initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    if (LocaleManager.instance.getBoolValue(Locale.LOGIN.value)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainView()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
  }
}
