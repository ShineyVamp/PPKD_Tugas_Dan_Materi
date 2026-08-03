import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pengingat extends StatefulWidget {
  const Pengingat({super.key});

  @override
  State<Pengingat> createState() => _PengingatState();
}

class _PengingatState extends State<Pengingat> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if (picked != null){
              setState(() {
                selectedTime = picked;
              });}
            }, child: Text("Pilih waktu Pengingat")),
            Text(selectedTime == null ? "Pilih waktu terlebih dahulu untuk menggunakan pengingat":"Waktu pengingat disetel pada ${DateFormat("HH:mm").format(DateTime(0,0,0,selectedTime!.hour, selectedTime!.minute))}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}