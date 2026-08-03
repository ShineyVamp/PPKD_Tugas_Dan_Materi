import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/syaratdanketentuan.dart';
import 'package:flutterday6/TugasFlutter/tugas7page/tema.dart';
import 'package:flutterday6/extension/navigation.dart';

class Tugas7flutter extends StatefulWidget {
  const Tugas7flutter({super.key});

  @override
  State<Tugas7flutter> createState() => _Tugas7flutterState();
}

class _Tugas7flutterState extends State<Tugas7flutter> {
  int _selectedButton = 0;
  int angka = 0;
  void changebutton(int index) {
    _selectedButton = index;
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOptions = [Syaratdanketentuan(), GantiTema()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Day 7 (INTERAKTIFD)"),
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
            listMenu(Icons.edit_document, "Persyaratan dan Ketentuan"),
            listMenu(Icons.light_mode, "Ganti Tema"),
            listMenu(Icons.trolley, "Kategori Produk"),
            listMenu(Icons.date_range, "Pilih Tanggal"),
            listMenu(Icons.notifications, "Atur Pengingat"),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedButton),
    );
  }

  ListTile listMenu(IconData icon, String teks) {
    return ListTile(
      leading: Icon(icon),
      title: Text(teks),
      onTap: () {
        changebutton(angka);
      },
    );
  }
}
