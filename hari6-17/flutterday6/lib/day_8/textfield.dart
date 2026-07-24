import 'package:flutter/material.dart';

class TextfieldDay8 extends StatelessWidget {
  const TextfieldDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("Text Field Say8"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 91, 255, 236),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "masukkan imel",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "masukkan paswor",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "masukkan imel",
              fillColor: Colors.black12,
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "masukkan imel",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(),
        ],
      ),
    );
  }
}
