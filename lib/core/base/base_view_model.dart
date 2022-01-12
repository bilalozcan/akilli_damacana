import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  late BuildContext context;
  void initialize(BuildContext context){
    this.context = context;
  }
}