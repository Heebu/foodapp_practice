import 'package:flutter/material.dart';
import 'package:foodapp_practice/Firebase/firebase_auth.dart';
import 'package:foodapp_practice/Reuseables/snackbars.dart';

import '../CustomPaint/signup_paint.dart';
import '../Reuseables/reuseable_buttons.dart';
import '../Reuseables/reuseable_header.dart';
import '../Reuseables/reuseable_textfields.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    forgotPasswordMeth() async {
      try {
        String result =
            await FireBase().forgotPassword(emailController.text.trim());
        if (result == 'Success') {
          Navigator.canPop(context);
        } else {
          showSnackBar(result, context);
        }
      } catch (e) {
        showSnackBar(e.toString(), context);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                TextHeader(text: 'Forgot Password?'),
                LogInTextField(
                    text: 'example@gmail.com',
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                    controller: emailController),
                GestureDetector(
                  onTap: forgotPasswordMeth,
                  child: Button(
                    text: 'Reset',
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
