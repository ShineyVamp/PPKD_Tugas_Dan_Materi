import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidgetDay13 extends StatefulWidget {
  const InputWidgetDay13({super.key});

  @override
  State<InputWidgetDay13> createState() => _InputWidgetDay13State();
}

class _InputWidgetDay13State extends State<InputWidgetDay13> {
  bool isChecked = true;
  bool isOn = true;
  String? selected;
  DateTime? selectedTime;
  TimeOfDay? selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          checkboxWidget(),
          switchWidget(),
          dropDownWidget(),
          dateWidget(context),
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                // firstDate: DateTime(1),
                // lastDate: DateTime.now(),
                // initialDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() {
                  selectedTimeOfDay = picked;
                });
              }
            },
            child: Text("Pilih Jam"),
          ),
          Column(
            children: [
              Text(
                selectedTimeOfDay == null
                    ? "Andak Belum Pilih Jam"
                    : selectedTimeOfDay.toString(),
              ),
              Text(
                selectedTimeOfDay == null
                    ? "Andak Belum Pilih Jam"
                    : DateFormat("HH:mm").format(
                        DateTime(
                          0,
                          0,
                          0,
                          selectedTimeOfDay!.hour,
                          selectedTimeOfDay!.minute,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column dateWidget(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        ),
        Column(
          children: [
            Text(
              selectedTime == null
                  ? "Andak Belum Pilih Tanggal"
                  : selectedTime.toString(),
            ),
            Text(
              selectedTime == null
                  ? "Andak Belum Pilih Tanggal"
                  : DateFormat(
                      "EEEE, dd MMMM yyyy",
                      'id_ID',
                    ).format(selectedTime ?? DateTime.now()),
            ),
          ],
        ),
      ],
    );
  }

  Column dropDownWidget() {
    return Column(
      children: [
        DropdownButton(
          value: selected,
          items: ["Merah", "Kuning", "Hijau"].map((String val) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        ),
        Text(selected.toString()),
        Container(
          height: 50,
          width: 50,
          color: selected == "Merah"
              ? Colors.red
              : selected == "Kuning"
              ? Colors.amberAccent
              : Colors.green,
        ),
      ],
    );
  }

  Column switchWidget() {
    return Column(
      children: [
        Switch(
          activeThumbImage: AssetImage("assets/images/moon.png"),
          activeThumbColor: Colors.white,
          activeTrackColor: Colors.white,
          inactiveThumbImage: AssetImage("assets/images/sun.png"),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.white,
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = !isOn;
            });
          },
        ),
        Text(isOn ? "Night" : "Day"),
      ],
    );
  }

  Column checkboxWidget() {
    return Column(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = !isChecked;
            });
          },
        ),
        Text(isChecked ? "Terceklis" : "Belum Ceklis"),
      ],
    );
  }
}
