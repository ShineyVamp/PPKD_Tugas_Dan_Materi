import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/services/preference_handler11.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/views/logintugas11.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/views/pagelogout.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:lottie/lottie.dart';

class SplashScreenDay11 extends StatefulWidget {
  const SplashScreenDay11({super.key});

  @override
  State<SplashScreenDay11> createState() => _SplashScreenDay11State();
}

class _SplashScreenDay11State extends State<SplashScreenDay11> {
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
      context.push(LoginTugas11());
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
