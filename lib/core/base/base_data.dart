import '../../model/user.dart';

class BaseData {
  static BaseData? _instance;

  static BaseData? get instance {
    _instance ??= BaseData._init();
    return _instance;
  }

  BaseData._init();

  User? user;
  String? address = '';
  String? phoneNumber = '';
  String? age = '';
  String? waterCount = '0';

}