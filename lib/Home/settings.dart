import 'package:flutter/material.dart';
import 'package:foodapp_practice/Login/login_screen.dart';

import '../Firebase/firebase_auth.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  signOutMethod() {
    FireBase().signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: signOutMethod,
          child: Text('SignOut'),
        ),
      ),
    );
  }
}
