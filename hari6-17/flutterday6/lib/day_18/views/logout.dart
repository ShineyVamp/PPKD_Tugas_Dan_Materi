import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/services/preference_handler11.dart';
import 'package:flutterday6/day_18/views/login_day18.dart';
import 'package:flutterday6/extension/navigation.dart';

class Logout18 extends StatefulWidget {
  const Logout18({super.key});

  @override
  State<Logout18> createState() => _Logout18State();
}

class _Logout18State extends State<Logout18> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            PreferenceHandler.logOut();
            context.pushAndRemoveAll(LoginDay18SqlFlite());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Berhasil Logout"),
                duration: Duration(milliseconds: 1200),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.logout), Text("LOGOUT SEKARANG")],
          ),
        ),
      ),
    );
  }
}
