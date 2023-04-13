import 'package:flutter/material.dart';
import 'package:foodapp_practice/Reuseables/snackbars.dart';

import '../CustomPaint/signup_paint.dart';
import '../Firebase/firebase_auth.dart';
import '../Home/home_page.dart';
import '../Reuseables/google_buttons.dart';
import '../Reuseables/reuseable_buttom_text.dart';
import '../Reuseables/reuseable_buttons.dart';
import '../Reuseables/reuseable_header.dart';
import '../Reuseables/reuseable_textfields.dart';
import '../Home/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController surnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    numberController.dispose();
    emailController.dispose();
    surnameController.dispose();
    nameController.dispose();
  }

  signUpMeth() async {
    setState(() {
      isLoading = true;
    });
    try {
      String result = await FireBase().signupAuth(
          emailController.text.trim(), passwordController.text.trim());

      if (result == 'Success') {
        setState(() {
          isLoading = false;
        });
        //Navigate to the homescreen
      } else {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: CustomPaint(
              painter: SignUpPaint(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                TextHeader(text: 'Hello...!'),
                LogInTextField(
                    text: 'Name',
                    textInputType: TextInputType.name,
                    obscure: false,
                    controller: nameController),
                LogInTextField(
                    text: 'Surname',
                    textInputType: TextInputType.name,
                    obscure: false,
                    controller: surnameController),
                LogInTextField(
                    text: 'example@gmail.com',
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                    controller: emailController),
                LogInTextField(
                    text: '+234-123-456-7891',
                    textInputType: TextInputType.phone,
                    obscure: false,
                    controller: numberController),
                LogInTextField(
                    text: '#########',
                    textInputType: TextInputType.visiblePassword,
                    obscure: true,
                    controller: passwordController),
                GestureDetector(
                  onTap: signUpMeth,
                  child: Button(
                    text: 'Sign Up',
                  ),
                ),
                const GoogleButton(
                  text: 'Google Sign In',
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: BottomTextButton(
                    text1: 'Already have an account?',
                    text2: 'SIgn In',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
