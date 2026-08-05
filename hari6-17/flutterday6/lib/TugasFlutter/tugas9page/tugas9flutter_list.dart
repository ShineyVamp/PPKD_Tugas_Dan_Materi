import 'package:flutter/material.dart';

class Tugas9flutterList extends StatefulWidget {
  const Tugas9flutterList({super.key});

  @override
  State<Tugas9flutterList> createState() => _Tugas9flutterListState();
}

class _Tugas9flutterListState extends State<Tugas9flutterList> {
  List<String> makanan = [
    "Nasi Goreng",
    "Rendang",
    "Sate Ayam",
    "Bakso",
    "Soto Ayam",
    "Gado-Gado",
    "Pempek",
    "Ayam Goreng",
    "Gudeg",
    "Martabak",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: makanan.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(makanan[index]));
        },
      ),
    );
  }
}
// ini tugas 9 yang list