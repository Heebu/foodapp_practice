import 'package:flutter/material.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton(
      {Key? key,
      required this.text1,
      required this.text2,
     })
      : super(key: key);
  final String text1;
  final String text2;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
            text: '$text1 ',
            children: [
              TextSpan(text: text2, style: TextStyle(color: Colors.red))
            ],
            style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
