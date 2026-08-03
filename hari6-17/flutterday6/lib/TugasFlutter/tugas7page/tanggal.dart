import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TanggalTugas7 extends StatefulWidget {
  const TanggalTugas7({super.key});

  @override
  State<TanggalTugas7> createState() => _TanggalTugas7State();
}

class _TanggalTugas7State extends State<TanggalTugas7> {
  DateTime? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () async {
            final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime.now(), initialDate: DateTime.now());
            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          }, child: Text("Klik disini untuk pilih tanggal")),
          Text(selectedTime == null? "Pilih tanggal terlebih dahulu":"Tanggal Lahir : ${DateFormat('dd-MM-yyyy', 'id_ID').format(selectedTime ?? DateTime.now())}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) // jangan lupa ${kalo panjang} nya
        ],
      ),),
    );
  }
}