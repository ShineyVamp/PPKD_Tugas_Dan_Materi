import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/services/preference_handler11.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/views/logintugas11.dart';
import 'package:flutterday6/extension/navigation.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            PreferenceHandler.logOut();
            context.pushAndRemoveAll(LoginTugas11());
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
