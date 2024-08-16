import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/my_button.dart';
import 'package:shop/my_textfeild.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/screens/auth/views/authservice.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void login(BuildContext context) async {
    final AuthService = AuthServices();
    // try login
    try {
      await AuthService.signinwithEmailAndPassword(
          emailController.text, passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }
  @override
  
//new statefullwidget end



  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
           // Wrapping with Form widget
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_dark.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with the data you entered during your registration.",
                    ),
                    
                    MyTextField(hintText: "Enter Your Email", obscuretext:false, textController: emailController),
                    MyTextField(hintText:"Enter Your Password", obscuretext: true, textController: passController),
                    const SizedBox(height: defaultPadding),
                    Align(
                      child: TextButton(
                        child: const Text("Forgot password"),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, passwordRecoveryScreenRoute);
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height > 700
                          ? size.height * 0.0
                          : defaultPadding,
                    ),
                    Center(
                      child: MyButton(
                        text: "Login",onTap: () => login(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signUpScreenRoute);
                          },
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
