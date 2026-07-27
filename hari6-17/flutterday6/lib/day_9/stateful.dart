import 'package:flutter/material.dart';

class StaeleFull extends StatefulWidget {
  const StaeleFull({super.key});

  @override
  State<StaeleFull> createState() => _StaeleFullState();
}

class _StaeleFullState extends State<StaeleFull> {
  int counter = 0;
  bool showImage = false;
  bool liked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Text("Nilai $counter"),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Notif"),
                onPressed: () {
                  debugPrint('kotak');
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("data")));
                },
              ),
              ElevatedButton(
                child: Text("Tmbah"),
                onPressed: () {
                  setState(() {
                    counter += 2;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Kurang"),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Reset"),
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                showImage = !showImage;
              });
            },
            child: Text(
              showImage ? "sembunyikan gambar" : "muncul gambar",
              style: TextStyle(fontSize: 40),
            ),
          ),
          if (showImage)
            Image.network("https://picsum.photos/200", width: 300, height: 200),
          IconButton(
            icon: Icon(
              liked ? Icons.favorite : Icons.favorite_border_outlined,
              color: liked ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                debugPrint('ikon klik');
                liked = !liked;
              });
            },
          ),
          TextButton(
            onPressed: () {
              debugPrint("ytta");
            },
            child: Text("data"),
          ),
          InkWell(
            onTap: () {
              debugPrint("gmbar");
            },
            child: Text("data"),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("p");
            },
            onDoubleTap: () {
              debugPrint("p 2");
            },
            onLongPress: () {
              debugPrint("p lama");
            },
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Text("data"),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              debugPrint("FaB diklik");
            },
            tooltip: "Tambah Data",
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
