import 'package:flutter/material.dart';

class Tugas1flutter extends StatelessWidget {
  const Tugas1flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffFFBE91), 
        title: Text("Profil Saya"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_rounded, size: 80,),
          Text("Zuhdi Azizi", style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold, 
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, color: Colors.red, size: 30),
              Text("Jekardah, Endonesya", style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Text("Seorang peserta pelatihan yang sedang mendalami Flutter di PPKD.", textAlign: TextAlign.center)
        ],
      ),
    );
  }
}