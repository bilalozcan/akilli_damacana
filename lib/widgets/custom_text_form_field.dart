import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  const CustomTextFormField(this.controller,{Key? key, this.hintText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText ?? '',
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(icon, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: Colors.white))
        ),
      ),
    );
  }
}
