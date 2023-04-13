import 'package:flutter/material.dart';

class LogInTextField extends StatelessWidget {
  const LogInTextField(
      {Key? key,
      required this.text,
      required this.textInputType,
      required this.obscure,
      required this.controller})
      : super(key: key);
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
