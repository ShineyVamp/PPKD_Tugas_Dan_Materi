import 'package:flutter/material.dart';

class GantiTema extends StatefulWidget {
  const GantiTema({super.key});

  @override
  State<GantiTema> createState() => _GantiTemaState();
}

class _GantiTemaState extends State<GantiTema> {
  bool _gantiTema = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _gantiTema? Colors.black:Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Simulator Mneyalakan Dan Mematikan Lampu", style: TextStyle(color: _gantiTema? Colors.white:Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            Switch(
              activeThumbColor: Colors.white,
              activeTrackColor: Colors.black,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.amber,
              // trackOutlineColor: MaterialStatePropertyAll(value), kalo mao langsung all
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states){
                if(states.contains(WidgetState.selected)){
                  return Colors.white;
                }
                return Colors.white;
              }), //kalo mao sesuwai kondisi
              trackOutlineWidth: MaterialStatePropertyAll(2),
              value: _gantiTema, onChanged: (value) {
              setState(() {
                _gantiTema = !_gantiTema;
              });
            },),
            Text(_gantiTema ? "Mati":"Nyala",style: TextStyle(color: _gantiTema? Colors.white:Colors.black, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
