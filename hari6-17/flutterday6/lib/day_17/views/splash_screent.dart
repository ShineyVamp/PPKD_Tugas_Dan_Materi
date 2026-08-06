import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas8flutter.dart';
import 'package:flutterday6/day_17/services/preference_handler.dart';
import 'package:flutterday6/day_17/views/login_day17.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:lottie/lottie.dart';

class SplashScreenDay17 extends StatefulWidget {
  const SplashScreenDay17({super.key});

  @override
  State<SplashScreenDay17> createState() => _SplashScreenDay17State();
}

class _SplashScreenDay17State extends State<SplashScreenDay17> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    if (PreferenceHandler.isLogin) {
      // ignore: use_build_context_synchronously
      context.push(Tugas8flutter());
    } else {
      // ignore: use_build_context_synchronously
      context.push(LoginDay17());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset("assets/animations/Incorrect.json"),
      ),
    );
  }
}
