import 'package:flutter/material.dart';

class InputWidgetDay13 extends StatefulWidget {
  const InputWidgetDay13({super.key});

  @override
  State<InputWidgetDay13> createState() => _InputWidgetDay13State();
}

class _InputWidgetDay13State extends State<InputWidgetDay13> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
