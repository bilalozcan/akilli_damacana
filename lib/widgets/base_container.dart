import 'package:flutter/material.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'package:smart_carboy/core/init/theme/light/color_scheme_light.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final String? image;

  const BaseContainer({Key? key, this.image,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.dynamicHeight(1),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
            image: image != null ? DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.fill) : null,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              ColorSchemeLight.instance!.lightGrayishBlue3,
              ColorSchemeLight.instance!.lightGrayishBlue,
              ColorSchemeLight.instance!.lightGrayishBlue4,
            ])),
        child: child);
    ;
  }
}
