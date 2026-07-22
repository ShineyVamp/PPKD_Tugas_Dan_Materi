import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tugas2flutter extends StatelessWidget {
  const Tugas2flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("Detail Toko"),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            heightFactor: 2,
            child: Text("Toko Komputer mas Amba", 
                        style: TextStyle(fontSize: 25, 
                                         fontFamily: 'JakartaSans', 
                                         fontWeight: FontWeight.bold,)),
            ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignOutside),
              boxShadow: [BoxShadow(color: Colors.black, 
                                    blurStyle: BlurStyle.solid, 
                                    blurRadius: 0, 
                                    offset: Offset(3, 3))]
            ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mail,color: CupertinoColors.tertiarySystemBackground),
                SizedBox(width: 15),
                Text("amabtuhkan@gmail.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'JakartaSans'),)
              ],
            ),
          ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5,),
                Text("01239847632"),
                Spacer(),
                Icon(Icons.location_on),
                SizedBox(width: 5,),
                Text("Jakarta, Indonesia")
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 199,
                    decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [BoxShadow(color: Colors.black, 
                                          blurStyle: BlurStyle.solid, 
                                          blurRadius: 0, 
                                          offset: Offset(3, 3))]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("500+", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JakartaSans'
                      ),),
                      Text("Pesanan Perangkat Komputer", textAlign: TextAlign.center,)
                    ],
                  ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 199,
                    decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [BoxShadow(color: Colors.black, 
                                          blurStyle: BlurStyle.solid, 
                                          blurRadius: 0, 
                                          offset: Offset(3, 3))]
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4.8/5", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JakartaSans',
                          ),textAlign: TextAlign.center,),
                          Icon(Icons.star, color: Colors.amber,)
                        ],
                      ),
                      Text("Pesanan Perangkat Komputer", textAlign: TextAlign.center,)
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 20),
          child: Text("Toko komputer mas amba menjual part part komputer, "
              "aksesoris komputer, dan lainnya pokoknya lengkap loh yah, mau beli apa aja boleh loh yah "
              "Pokoknya percaya aja sama toko mas amba", textAlign: TextAlign.justify,)
          ),
            Container(
            height: 350,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignOutside),
              boxShadow: [BoxShadow(color: Colors.black, 
                                    blurStyle: BlurStyle.solid, 
                                    blurRadius: 0, 
                                    offset: Offset(3, 3))],
              image: DecorationImage(image: AssetImage("assets/images/rt.jpg"),fit: BoxFit.cover)
            ),
          ),
        ],
      ),
    );
  }
}