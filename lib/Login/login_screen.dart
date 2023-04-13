import 'package:flutter/material.dart';
import 'package:foodapp_practice/Login/signup_screen.dart';
import 'package:foodapp_practice/Reuseables/google_buttons.dart';

import '../CustomPaint/login_paint.dart';
import '../Firebase/firebase_auth.dart';
import '../Home/home_page.dart';
import '../Reuseables/reuseable_buttom_text.dart';
import '../Reuseables/reuseable_buttons.dart';
import '../Reuseables/reuseable_header.dart';
import '../Reuseables/reuseable_textfields.dart';
import '../Reuseables/snackbars.dart';
import '../Home/home.dart';
import 'forgot_password.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  signInMeth() async {
    setState(() {
      isLoading = true;
    });
    try {
      String result = await FireBase().signInAuth(
          emailController.text.trim(), passwordController.text.trim());
      if (result == 'Success') {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(result, context);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.maxFinite,
              // color: Colors.white,
              child: CustomPaint(
                painter: BubblesPaint(),
              ),
            ),
            TextHeader(
              text: 'Welcome Back',
            ),
            LogInTextField(
              text: 'example@gmail.com',
              textInputType: TextInputType.emailAddress,
              obscure: false,
              controller: emailController,
            ),
            LogInTextField(
              text: '#############',
              textInputType: TextInputType.visiblePassword,
              obscure: true,
              controller: passwordController,
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ));
                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: signInMeth,
              child: Button(
                text: 'Login',
              ),
            ),
            const GoogleButton(text: 'Google Login'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BottomTextButton(
                  text1: 'New User',
                  text2: 'Sign Up',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
