import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscuretext;
  final TextEditingController textController;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscuretext,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: TextStyle(
                      color: Colors.black, // Set the font color here
                    ),
          obscureText: obscuretext,
          controller: textController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white)),
                
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple)),
              fillColor: Colors.white,
              filled: true,
              
              hintText: hintText,
              hintStyle: TextStyle(color: const Color.fromARGB(92, 49, 39, 39)))),
    );
  }
}


