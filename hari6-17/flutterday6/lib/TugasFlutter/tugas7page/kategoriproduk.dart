import 'package:flutter/material.dart';

class Kategoriproduk extends StatefulWidget {
  const Kategoriproduk({super.key});

  @override
  State<Kategoriproduk> createState() => _KategoriprodukState();
}

class _KategoriprodukState extends State<Kategoriproduk> {
  String?selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: selected,
              items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((String val) {
              return DropdownMenuItem(value: val,child: Text(val));
            }).toList(), onChanged: (value) {
              setState(() {
                selected = value;
              });
            },),
            RichText(
              text: TextSpan(text: "Aku Adalah", style: TextStyle(fontSize: 20, color: Colors.black),/* style: DefaultTextStyle.of(context).style (kalo mau langsung default)*/
              children: <TextSpan>[
              TextSpan(text: " $selected", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " Saya")
            ]), ) // nyoba richtext
            // Text("Anda Memilih Kategori $selected", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}