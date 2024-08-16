import 'dart:js_interop';

// import 'package:eproject/LoginPage.dart';
// import 'package:eproject/contactus.dart';
// import 'package:eproject/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/login_or_register.dart';
import 'package:shop/route/screen_export.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return  DiscoverScreen();
            }
            // user is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
