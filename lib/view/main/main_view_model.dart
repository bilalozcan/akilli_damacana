import 'package:smart_carboy/core/base/base_view_model.dart';

class MainViewModel extends CustomBaseViewModel {
  int _bottomBarIndex = 1;

  int get bottomBarIndex => _bottomBarIndex;

  set bottomBarIndex(int value) {
    _bottomBarIndex = value;
    notifyListeners();
  }
}