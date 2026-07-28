import 'package:flutter/material.dart';

class Tugas5flutter extends StatefulWidget {
  const Tugas5flutter({super.key});

  @override
  State<Tugas5flutter> createState() => _Tugas5flutterState();
}

class _Tugas5flutterState extends State<Tugas5flutter> {
  bool texteks = true;
  bool elteks = true;
  bool liked = true;
  bool terdetek = true;
  int angka = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INTERAKSI FLUTTER"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 70),
            if (elteks) Text("Ini tombol elevated"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  elteks = !elteks;
                });
              },
              child: Text("Klik tombol ini"),
            ),
            SizedBox(height: 20),
            Text("Ini icon button"),
            IconButton(
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
              },
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border_outlined,
                color: liked ? Colors.red : Colors.black,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            if (texteks) Text("Anjay Aku Muncul"),
            TextButton(
              onPressed: () {
                setState(() {
                  texteks = !texteks;
                });
              },
              child: Text("Ayo Klik Teks ini juga"),
            ),
            SizedBox(height: 20),
            InkWell(
              splashColor: Colors.black,
              // borderRadius: BorderRadius.circular(15),
              onTap: () {
                setState(() {
                  terdetek = !terdetek;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
                child: Text("Sentuh Kotak Ini"),
              ),
            ),
            if (terdetek) Text("Kotak Di Klik"),
            SizedBox(height: 20),
            Text(
              "data $angka",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  angka += 1;
                });
              },
              onDoubleTap: () {
                setState(() {
                  angka += 2;
                });
              },
              onLongPress: () {
                setState(() {
                  angka += 5;
                });
              },
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amberAccent,
                child: Text("CEK GESTUR SESUAI ATURAN"),
              ),
            ),
            Text(
              "1. Tap Sekali angka ditambah 1 \n2. Tap Double angka ditambah 2 \n3. Tekan Lama angka ditambah 5",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            angka--;
          });
        },
        tooltip: "Tambah Data",
        child: Icon(Icons.remove),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
