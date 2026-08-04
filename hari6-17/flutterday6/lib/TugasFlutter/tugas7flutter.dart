import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/kategoriproduk.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/pengingat.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/syaratdanketentuan.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/tanggal.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/tema.dart';
import 'package:flutterday6/extension/navigation.dart';

class Tugas7flutter extends StatefulWidget {
  const Tugas7flutter({super.key});

  @override
  State<Tugas7flutter> createState() => _Tugas7flutterState();
}

class _Tugas7flutterState extends State<Tugas7flutter> {
  int _selectedButton = 0;
  void changebutton(int index) {
    _selectedButton = index;
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOptions = [
    Syaratdanketentuan(),
    GantiTema(),
    Kategoriproduk(),
    TanggalTugas7(),
    Pengingat(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedButton == 0
              ? "Persyaratan Dan Ketentuan"
              : _selectedButton == 1
              ? "Ganti Tema"
              : _selectedButton == 2
              ? "Kategori Produk"
              : _selectedButton == 3
              ? "Pilih Tanggal"
              : "Atur Pengingat",
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            listMenu(Icons.edit_document, "Persyaratan dan Ketentuan", 0),
            listMenu(Icons.light_mode, "Ganti Tema", 1),
            listMenu(Icons.trolley, "Kategori Produk", 2),
            listMenu(Icons.date_range, "Pilih Tanggal", 3),
            listMenu(Icons.notifications, "Atur Pengingat", 4),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedButton),
    );
  }

  ListTile listMenu(IconData icon, String teks, int angka) {
    return ListTile(
      leading: Icon(icon),
      title: Text(teks),
      onTap: () {
        changebutton(angka);
      },
    );
  }
}
