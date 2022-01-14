import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_carboy/core/base/base_data.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/core/constants/enum/locale_enum.dart';
import 'package:smart_carboy/core/extensions/locale_extension.dart';
import 'package:smart_carboy/core/init/cache/locale_manager.dart';
import 'package:smart_carboy/core/init/network/network_manager.dart';
import 'package:smart_carboy/service/auth_service.dart';
import 'package:smart_carboy/view/main/main_view.dart';

class LoginViewModel extends CustomBaseViewModel {
  final AuthService _authService = AuthService.instance!;
  final userName = TextEditingController(text: 'dev@qdigitalagency.com');
  final password = TextEditingController(text: 'asdfasdf');

  @override
  void initialize(BuildContext context) {
    this.context = context;
  }

  void login() async {
    isLoading = true;
    var result = await _authService.login(userName.text, password.text);
    if (result != null) {
      BaseData.instance!.user = result.user;
      LocaleManager.instance.setBoolValue(Locale.LOGIN.value, true);
      LocaleManager.instance.setStringValue(Locale.TOKEN.value, result.token!);
      NetworkManager.instance!.dio.options.headers = {
        'Authorization': 'Bearer ${result.token!}'
      };
      NetworkManager.instance!.dioFile.options.headers = {
        'Authorization': 'Bearer ${result.token!}'
      };
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainView()));
    } else {
      Fluttertoast.showToast(msg: 'Email veya şifre hatalı!');
    }
    isLoading = false;
  }
}
