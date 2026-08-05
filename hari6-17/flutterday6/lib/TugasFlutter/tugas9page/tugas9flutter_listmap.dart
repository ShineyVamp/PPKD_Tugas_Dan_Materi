import 'package:flutter/material.dart';

class Tugas9flutterListmap extends StatefulWidget {
  const Tugas9flutterListmap({super.key});

  @override
  State<Tugas9flutterListmap> createState() => _Tugas9flutterListmapState();
}

class _Tugas9flutterListmapState extends State<Tugas9flutterListmap> {
  List<Map<String, dynamic>> warteg = [
    {"nama": "Nasi Goreng", "image": "assets/images/tugas9/nasigoreng.jpg"},
    {"nama": "Rendang", "image": "assets/images/tugas9/rendang.jpg"},
    {"nama": "Sate Ayam", "image": "assets/images/tugas9/sate.jpg"},
    {"nama": "Bakso", "image": "assets/images/tugas9/bakso.jpg"},
    {"nama": "Soto Ayam", "image": "assets/images/tugas9/soto.jpg"},
    {"nama": "Gado-Gado", "image": "assets/images/tugas9/gado.jpg"},
    {"nama": "Pempek", "image": "assets/images/tugas9/pempek.jpg"},
    {"nama": "Ayam Goreng", "image": "assets/images/tugas9/ayam.jpg"},
    {"nama": "Gudeg", "image": "assets/images/tugas9/gudeg.jpg"},
    {"nama": "Martabak", "image": "assets/images/tugas9/martabak.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: warteg.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(warteg[index]["image"], fit: BoxFit.cover),
            ),
            title: Text(warteg[index]["nama"]),
          );
        },
      ),
    );
  }
}

//ini tugas 9 yang listmap
