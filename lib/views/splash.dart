import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);
  //const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/logoslash.png',),
      title: Text(
        'RecetIA',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'ro',
          fontSize: 19,
          fontWeight: FontWeight.bold,
          ),
          ),
          backgroundColor: background,
          showLoader: true,
          loaderColor: Colors.black,
          navigator: login(),
          durationInSeconds: 5,
      );
  }
}