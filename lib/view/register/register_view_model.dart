import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';

class RegisterViewModel extends CustomBaseViewModel {
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordAgain = TextEditingController();

  @override
  void initialize(BuildContext context) {
    // TODO: implement initialize
  }

  void register() {
    if(email.text.isNotEmpty && password.text.isNotEmpty && passwordAgain.text.isNotEmpty){
      Fluttertoast.showToast(msg: 'Kayıt Başarılır');
      context.pop();
    }else {
      Fluttertoast.showToast(msg: 'Tüm alanları doldurunuz');
    }

  }
}
