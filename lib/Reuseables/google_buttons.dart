import 'package:flutter/material.dart';
import 'package:foodapp_practice/Home/home_page.dart';
import 'package:foodapp_practice/Reuseables/snackbars.dart';

import '../Firebase/firebase_auth.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    googleAuthMeth() {
      try {
        FireBase().googleSignIn();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } catch (e) {
        showSnackBar(e.toString(), context);
      }
    }

    return GestureDetector(
      onTap: googleAuthMeth,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(5),
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Colors.blue,
                Colors.red,
                Colors.yellow,
                Colors.green
              ]),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
