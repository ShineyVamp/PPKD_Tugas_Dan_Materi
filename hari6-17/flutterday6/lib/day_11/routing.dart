import 'package:flutter/material.dart';
import 'package:flutterday6/day_11/home.dart';

class RoutingDay11 extends StatelessWidget {
  const RoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing DAY 11"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tombolPush(context, "anjay"),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Text("PushNmamed"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
                );
              },
              child: Text("PushReplacement"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
                );
              },
              child: Text("PushReplacement"),
            ),
          ),
        ],
      ),
    );
  }

  Center tombolPush(BuildContext context, String text) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
          );
        },
        child: Text(text),
      ),
    );
  }
}
