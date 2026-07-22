import 'package:flutter/material.dart';

class ContainerDay6 extends StatelessWidget {
  const ContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4efdc),
      appBar: AppBar(
        title: Text("Container"),
        titleTextStyle: TextStyle(color: const Color.fromARGB(255, 2, 2, 2), fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            // container 1
            child: Container(
              height: 100,
              width: 400,
              color: Colors.amber,
            ),
          ),
          // container 2
          Row(
            children: [
              Container(
                height: 100,
                width: 200,
                color: Colors.indigo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
                  children: [ // hanya bisa diisi yang support list
                    Text("Nama : agus", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                    Text("Hobi : Manving", style: TextStyle(color: Colors.white),),
                    Text("Alamat : Ytta", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
        Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo,
            ),
            child: Column( // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
              children: [ // hanya bisa diisi yang support list
                Text("1", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
              ],
            ),
          ),
            ],
          ),
          // container 3
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            height: 100,
            width: 200,
            color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
              children: [ // hanya bisa diisi yang support list
                Text("Nama : agus", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                Text("Hobi : Manving", style: TextStyle(color: Colors.white),),
                Text("Alamat : Ytta", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          // container 4
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            height: 100,
            width: 200,
            // color: Colors.green,
            decoration: BoxDecoration(
              color: Colors.green, //h harus ditulis dalam decoration jika pakai decoration, jika tidak akan error
              // backgroundBlendMode: BlendMode.color
              border: Border.all(color: Colors.black, width: 2, strokeAlign: 15),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
              children: [ // hanya bisa diisi yang support list
                Text("Nama : agus", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                Text("Hobi : Manving", style: TextStyle(color: Colors.white),),
                Text("Alamat : Ytta", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          // container 5
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            height: 100,
            width: 200,
            // color: Colors.green,
            decoration: BoxDecoration(
              color: Colors.green, //h harus ditulis dalam decoration jika pakai decoration, jika tidak akan error
              // backgroundBlendMode: BlendMode.color
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.solid,
                  blurRadius: 0,
                  spreadRadius: 2,
                  color: Colors.black,
                  offset: Offset(2,5)
                )
              ]
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
              children: [ // hanya bisa diisi yang support list
                Text("Nama : agus", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                Text("Hobi : Manving", style: TextStyle(color: Colors.white),),
                Text("Alamat : Ytta", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            height: 100,
            width: 200,
            // color: Colors.green,
            decoration: BoxDecoration(
              color: Colors.green, //harus ditulis dalam decoration jika pakai decoration, jika tidak akan error
              // backgroundBlendMode: BlendMode.color
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.solid,
                  blurRadius: 0,
                  spreadRadius: 2,
                  color: Colors.black,
                  offset: Offset(2,5)
                )
              ],
              gradient: LinearGradient(colors:[Colors.deepPurpleAccent, Colors.amber])
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // agar align bisa diterapkan harus ditulis di yang punya children nya (parent)
              children: [ // hanya bisa diisi yang support list
                Text("Nama : agus", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                Text("Hobi : Manving", style: TextStyle(color: Colors.white),),
                Text("Alamat : Ytta", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}