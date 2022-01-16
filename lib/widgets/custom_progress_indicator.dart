import 'package:flutter/material.dart';
import '../core/extensions/context_extension.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: context.themeData.colorScheme.primaryVariant);
  }
}
