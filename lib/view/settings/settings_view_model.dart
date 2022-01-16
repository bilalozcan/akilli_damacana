import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_carboy/core/base/base_data.dart';
import '../../core/base/base_view_model.dart';

class SettingsViewModel extends CustomBaseViewModel {
  var addressController = TextEditingController(text: BaseData.instance!.address);
  var phoneNumberController = TextEditingController(text: BaseData.instance!.phoneNumber);
  var ageController = TextEditingController(text: BaseData.instance!.age);
  var waterCountController = TextEditingController(text: BaseData.instance!.waterCount);
  String _waterCount = BaseData.instance!.waterCount!;

  String get waterCount => _waterCount;

  set waterCount(String value) {
    _waterCount = value;
    notifyListeners();
  }

  @override
  void initialize(BuildContext context) {

  }

  void save(){
    BaseData.instance!.address = addressController.text;
    BaseData.instance!.phoneNumber = phoneNumberController.text;
    BaseData.instance!.age = ageController.text;
    BaseData.instance!.waterCount = waterCountController.text;
    waterCount = waterCountController.text;
    Fluttertoast.showToast(msg: 'Bilgiler başarılı bir şekilde kaydedildi');
  }

}