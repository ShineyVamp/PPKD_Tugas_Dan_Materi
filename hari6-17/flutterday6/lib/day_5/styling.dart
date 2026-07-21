import 'package:flutter/material.dart';

class StylingDay5 extends StatelessWidget {
  const StylingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffFFBE91), 
        title:  Text("LayoutingDay5"),
        centerTitle: true,
        actions: [Text("1"), Text("2")],
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        spacing: 20,
        children: [
          Text("hello batch", style: TextStyle(
          fontSize: 20, // ukuran
          fontWeight: FontWeight.bold, // ketebalan
          color: Colors.red, // warna font
          )),

          Text("hello batch", style: TextStyle(
          fontSize: 50, // ukuran
          fontWeight: FontWeight.bold, // ketebalan
          color: Colors.red,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dotted,
          backgroundColor: Colors.yellow  
          ))
          ],
      ),
    );
  }
}