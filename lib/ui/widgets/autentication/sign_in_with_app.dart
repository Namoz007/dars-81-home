import 'package:flutter/material.dart';

class SignInWithApp extends StatefulWidget {
  const SignInWithApp({super.key});

  @override
  State<SignInWithApp> createState() => _SignInWithAppState();
}

class _SignInWithAppState extends State<SignInWithApp> {
  List<String> _signInOptions = [
    "facebook.png",
    "github.png",
    "google.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(int i = 0;i < _signInOptions.length;i++)
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/imgs/${_signInOptions[i]}"),fit: BoxFit.cover)
              ),
            ),
          ),
      ],
    );
  }
}
