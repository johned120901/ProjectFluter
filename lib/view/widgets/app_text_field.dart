import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController textEditingController;
  const AppTextField({Key key, this.hintText, this.icon, this.obscureText=false, this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: icon,

          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusColor: Colors.black,
          fillColor: Colors.black,
          hoverColor: Colors.black,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
