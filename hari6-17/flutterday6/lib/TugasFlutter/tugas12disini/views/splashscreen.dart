import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas12disini/views/logintugas12.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splashscreen12 extends StatefulWidget {
  const Splashscreen12({super.key});

  @override
  State<Splashscreen12> createState() => _Splashscreen12State();
}

class _Splashscreen12State extends State<Splashscreen12> {
  @override
  void initState(){
    super.initState();
    goToLogin();
  }

    void goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
      if(!mounted) return null;
      context.pushAndRemoveAll(Logintugas12());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F0E7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/tuags12/Rlogos.png", width: 150),
            Text("RENJANA", style: GoogleFonts.dmSerifDisplay(fontSize: 38)),
            Text("Museum Indonesia Dalam Genggaman", style: GoogleFonts.plusJakartaSans(fontSize: 18)),
            SizedBox(
              height: 50,
              width: 300,
              child: LottieBuilder.asset('assets/animations/loading.json', fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}