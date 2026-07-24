import 'package:flutter/material.dart';

class Tugas3flutter extends StatelessWidget {
  const Tugas3flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("Registrasi & Edukasi"),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 91, 255, 236),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(5, 5)),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 15,
                  children: [
                    Text(
                      "Form Registrasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        // prefix: ,
                        labelText: "Nama Pengguna",
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        // prefix: ,
                        labelText: "Email Pengguna",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        // prefix: ,
                        labelText: "Telephone Pengguna",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        // prefix: ,
                        labelText: "Input Password",
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        // prefix: ,
                        labelText: "Konfirmasi Password",
                        hintText: "Masukkan Konfirmasi Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Wilayah Pemantauan Kualitas Udara",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 5,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    child: Stack(
                      alignment: AlignmentGeometry.bottomCenter,
                      children: [
                        Image(image: AssetImage("assets/images/rt.jpg")),
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.amberAccent,
                        ),
                        Text("text"),
                      ],
                    ),
                  ),
                  Container(color: Colors.amber),
                  Container(color: Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
