import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/services/preference_handler11.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/views/pagelogout.dart';
import 'package:flutterday6/day_18/views/login_day18.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:lottie/lottie.dart';

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key});

  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
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
      context.push(TambahTugas11());
    } else {
      // ignore: use_build_context_synchronously
      context.push(LoginDay18SqlFlite());
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
