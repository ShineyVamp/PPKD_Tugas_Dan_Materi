import 'package:flutter/material.dart';

class LayoutingDay6 extends StatelessWidget {
  const LayoutingDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFBE91),
        title: Text("LayoutingDay6"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        // spacing: 20,
        children: [
          Text("batu"),
          SizedBox(height: 40), //memberikan kotak transparan diantara objek
          Text("batu"),
          SizedBox(height: 20),
          Text("batu"),
          SizedBox(
            // memberikan kotak transparan untuk spacing
            height: 50,
            child: Row(children: [Text("batu"), Icon(Icons.star)]),
          ),
          Text("hello"),
          Text("batu"),
          // penggunaan pading
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2, 0, 0),
            child: Row(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                // Text("penggunaan padding")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                // Text("penggunaan padding")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
