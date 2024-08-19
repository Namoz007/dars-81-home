import 'package:flutter/material.dart';

class SignInWithApp extends StatefulWidget {
  const SignInWithApp({super.key});

  @override
  State<SignInWithApp> createState() => _SignInWithAppState();
}

class _SignInWithAppState extends State<SignInWithApp> {
  List<String> _signInOptions = [
    "https://d1yei2z3i6k35z.cloudfront.net/161/5f354310d6941_FB.png",
    "https://img2.freepng.ru/20181123/jco/kisspng-scalable-vector-graphics-g-suite-computer-icons-go-5bf7e7dd3349c9.5370207215429734052101.jpg",
    "https://cdn.wikimg.net/en/splatoonwiki/images/thumb/8/88/GitHub_Icon.svg/1200px-GitHub_Icon.svg.png"
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
                  image: DecorationImage(image: NetworkImage("${_signInOptions[i]}"),fit: BoxFit.cover)
              ),
            ),
          ),
      ],
    );
  }
}
