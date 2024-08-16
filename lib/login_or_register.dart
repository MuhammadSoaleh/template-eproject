import 'package:flutter/material.dart';
// import 'package:shop/screens/auth/views/components/login_form.dart';
// import 'package:shop/screens/auth/views/components/sign_up_form.dart';
import 'package:shop/screens/auth/views/login_screen.dart';
import 'package:shop/screens/auth/views/signup_screen.dart';
// import 'package:eproject/LoginPage.dart';
// import 'package:eproject/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
       return LoginPage();
    } else {
      return SignUpScreen(
        
      );
    }
  }
}
