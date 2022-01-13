import 'package:flutter/material.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;

  const BaseContainer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.dynamicHeight(1),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffA1D2F1),
              Color(0xffE2F2FC),
              Color(0xff9FD1F1),
            ])),
        child: child);
    ;
  }
}