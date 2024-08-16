import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop/my_button.dart';
import 'package:shop/my_textfeild.dart';
import 'package:shop/screens/auth/views/authservice.dart';
import 'package:shop/route/route_constants.dart';

import '../../../constants.dart';

class SignUpScreen extends StatefulWidget {
  

  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conformpassController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  bool agreeToTerms = false;

  void register(BuildContext context) {
    final auth = AuthServices();
    if (passController.text == conformpassController.text) {
      try {
        auth.signupwithemailpassword(emailController.text, passController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/signUp_dark.png",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get started!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Please enter your valid data in order to create an account.",
                  ),
                  const SizedBox(height: defaultPadding),
                  MyTextField(
                    hintText: "Enter Your Email",
                    obscuretext: false,
                    textController: emailController,
                  ),
                  const SizedBox(height: defaultPadding),
                  MyTextField(
                    hintText: "Enter Your Password",
                    obscuretext: true,
                    textController: passController,
                  ),
                  const SizedBox(height: defaultPadding),
                  MyTextField(
                    hintText: "Conform Your Password",
                    obscuretext: true,
                    textController: conformpassController,
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                        value: agreeToTerms,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "I agree with the",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, termsOfServicesScreenRoute);
                                  },
                                text: " Terms of service ",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "& privacy policy.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: MyButton(text: "Signup", onTap: () => register(context))
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do you have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, logInScreenRoute);
                        },
                        child: const Text("Log in"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
