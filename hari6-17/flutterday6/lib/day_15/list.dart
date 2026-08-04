import 'package:flutter/material.dart';

class ListDataDay13 extends StatelessWidget {
  ListDataDay13({super.key});
  final List<String> namaBuah = [
    "Apel",
    "Mangga",
    "Pisang",
    "Jeruk",
    "Anggur",
    "Semangka",
    "Melon",
    "Stroberi",
    "Nanas",
    "Pepaya",
    "Durian",
    "Rambutan",
    "Nangka",
    "Salak",
    "Alpukat",
    "Ceri",
    "Kelapa",
    "Manggis",
    "Jambu",
    "Kiwi",
    "Markisa",
    "Lemon",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaBuah.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(namaBuah[index]);
        },
      ),
    );
  }
}
