import 'package:flutter/material.dart';

class HomeAbalday19 extends StatelessWidget {
  const HomeAbalday19({super.key, required this.email, this.password});
  final String email;
  final String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(email), Text(password ?? "Tidak ada passwortd")],
        ),
      ),
    );
  }
}
