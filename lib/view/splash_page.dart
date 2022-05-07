import 'dart:async';
import 'package:flutter/material.dart';
import 'package:podk/components/bottom_navigation.dart';
import 'package:podk/components/colors.dart' as color;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/lead');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [color.AppColor.blackColor, color.AppColor.blackColor],
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/background/PodK.png',
              // height:300.0,
              // width: 300.0
            ),
            const SizedBox(height: 40.0),
            CircularProgressIndicator(
              color: color.AppColor.mainColor,
            )
          ]
        )
      )
    );
  }
}
