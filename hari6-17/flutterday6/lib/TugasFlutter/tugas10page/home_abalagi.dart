import 'package:flutter/material.dart';

class HomeAbalagi extends StatelessWidget {
  const HomeAbalagi({
    super.key,
    required this.nama,
    required this.email,
    required this.nomor,
    required this.asal,
  });
  final String nama;
  final String email;
  final String nomor;
  final String asal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Terima Kasih! ",
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(
                    text: nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " Warga "),
                  TextSpan(
                    text: asal,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " Sudah Mendaftar!!"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
