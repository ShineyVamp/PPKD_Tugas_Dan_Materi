import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Kami"),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("ShadowHeist: Akademi Master Pencuri\n", textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        Text("Aplikasi simulator dan panduan taktik stealth interaktif untuk para agen rahasia dan pencuri profesional di dunia "
            "Pelajari seni menyelinap tanpa terdeteksi, teknik membobol brankas berteknologi tinggi, strategi meretas kamera pengawas, "
            "hingga perencanaan jalur melarikan diri yang sempurna dari kejaran aparat. "
            "Dilengkapi dengan simulasi pembobolan 3D, analisis kelemahan sistem keamanan, serta kalkulator risiko perampokan. "
            "Rancang strategi terbaikmu dan jadilah 'Pencuri Legendaris' tanpa meninggalkan jejak sedikit pun!\n", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
        Text("Dibuat oleh: Guweh\n", style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Versi Aplikasi: 2.0.4-LupinEdition", style: TextStyle(fontWeight: FontWeight.bold))      
      ],),),
    );
  }
}