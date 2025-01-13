// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:crepto/OnBoardingScreen/OnboardingScreen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
    Get.to(()=>OnboardingScreen());
    });
  }

  // goToStartScreen() {
  //   bool firstTime = SharedPref.getFirstTime();
  //
  //   if (firstTime) {
  //     Get.offAll(() => const IntroScreen());
  //   } else {
  //     // bool loggedIn = SharedPref.getLogin();
  //     // if (!loggedIn) {
  //     //   Get.to(() => const LoginScreen());
  //     // } else {
  //     Get.offAll(() => const DashboardScreen(selectedIndex: 0));
  //
  //     // }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Image.asset(
            width: double.infinity,
            'assets/images/splash_screen.png',
            fit: BoxFit.fill,
          )),
    );
  }
}
