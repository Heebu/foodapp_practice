import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: 200,
      //color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        text,
        softWrap: true,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'brush script mt kursiv',
        ),
      ),
    );
  }
}
