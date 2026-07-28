import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageDay5State extends StatefulWidget {
  const ImageDay5State({super.key});

  @override
  State<ImageDay5State> createState() => _ImageDay5StateState();
}

class _ImageDay5StateState extends State<ImageDay5State> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              showImage
                  ? Image.asset("assets/images/rt.jpg", height: 200)
                  : Shimmer(
                      child: Container(
                        color: Colors.blue,
                        width: 200,
                        height: 200,
                      ),
                    ),
              showImage
                  ? Image.network(
                      "https://i0.wp.com/resepkoki.id/wp-content/uploads/2020/12/Resep-Nasi-Padang.jpg?fit=500%2C667&ssl=1",
                      height: 200,
                    )
                  : Text("data"),
              showImage
                  ? Image.network(
                      "https://i0.wp.com/resepkoki.id/wp-content/uploads/2020/12/Resep-Nasi-Padang.jpg?fit=500%2C667&ssl=1",
                      height: 200,
                    )
                  : Text("data"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: showImage ? Colors.amber : Colors.cyan,
                ),
                onPressed: () {
                  setState(() {});
                  showImage = !showImage;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(showImage ? "gambar ada" : "gambar hilang"),
                    ),
                  );
                },
                child: Text(showImage ? "sembunyikan" : "tampilkan"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
