import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2, )).then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> OnBoardingScreen()));

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(
              fit: BoxFit.cover
            ),
          ),
          Center(
            // child: SvgPicture.asset(Assets.img.icons.logo, width: 150,),
            child: Assets.img.icons.logo.svg(width: 150),

          )
        ],
      ),
    );
  }
}