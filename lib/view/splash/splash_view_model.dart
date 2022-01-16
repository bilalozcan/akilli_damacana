import 'package:flutter/material.dart';
import '../../core/base/base_data.dart';
import '../../core/base/base_view_model.dart';
import '../../core/constants/enum/locale_enum.dart';
import '../../core/extensions/locale_extension.dart';
import '../../core/init/cache/locale_manager.dart';
import '../../service/auth_service.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';

class SplashViewModel extends CustomBaseViewModel {
  final AuthService _authService = AuthService.instance!;
  @override
  void initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    if (LocaleManager.instance.getBoolValue(Locale.LOGIN.value)) {
      var result = await _authService.getProfile();
      if(result != null) {
        BaseData.instance?.user = result.user;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainView()));
      }

    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
  }
}
