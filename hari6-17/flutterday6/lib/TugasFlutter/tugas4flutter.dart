import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Setoran Copet"),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.horizontal(
            start: Radius.circular(20),
            end: Radius.circular(20),
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        elevation: 2,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: -2, offset: Offset(0, 2))],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    spacing: 10, // maunya pake spacing aja ya pak hehe, biar langsung semua gausah ketik sizedbox lagi
                    children: [
                      Text("Data Setoran", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Nama",
                          hintText: "Masukkan Nama Lengkap",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.luggage),
                          labelText: "Tipe Barang",
                          hintText: "Masukkan Tipe Barang",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          labelText: "Jumlah",
                          hintText: "Masukkan Jumlah Barang",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          labelText: "Lokasi",
                          hintText: "Masukkan Lokasi",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 50,radius: BorderRadius.circular(20),thickness: 5,color: Colors.black,),
                Column(
                  spacing: 15,
                  children: [
                    Material(
                      shadowColor: Colors.black,
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(15))),
                        leading: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: -3),]
                        ),
                        child: Icon(Icons.person, ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(bottom:5),
                          child: Text("Japri", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                        ),
                        subtitle: Text(("Barang : Dompet, \nJumlah : 30,\nLokasi : Terminal")),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                Material(
                  shadowColor: Colors.black,
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(15))),
                    leading: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: -3),]
                    ),
                    child: Icon(Icons.person, ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom:5),
                      child: Text("Inbox", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                    ),
                    subtitle: Text(("Barang : Kalung, \nJumlah : 10,\nLokasi : Angkot")),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Material(
                  shadowColor: Colors.black,
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(15))),
                    leading: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: -3),]
                    ),
                    child: Icon(Icons.person, ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom:5),
                      child: Text("Dm", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                    ),
                    subtitle: Text(("Barang : Hape, \nJumlah : 3,\nLokasi : Jalan")),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Material(
                  shadowColor: Colors.black,
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(15))),
                    leading: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: -3),]
                    ),
                    child: Icon(Icons.person, ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom:5),
                      child: Text("Ping", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                    ),
                    subtitle: Text(("Barang : Agus, \nJumlah : 1,\nLokasi : RS")),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Material(
                  shadowColor: Colors.black,
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(15))),
                    leading: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: -3),]
                    ),
                    child: Icon(Icons.person, ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom:5),
                      child: Text("Japri", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                    ),
                    subtitle: Text(("Barang : Bayu, \nJumlah : 2,\nLokasi : SD")),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                )                                         
                  ],
                ),
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}
