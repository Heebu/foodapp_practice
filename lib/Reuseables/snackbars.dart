import 'package:flutter/material.dart';

showSnackBar(String text, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), backgroundColor: Colors.transparent,));

}
