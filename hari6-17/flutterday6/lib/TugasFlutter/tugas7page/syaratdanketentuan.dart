import 'package:flutter/material.dart';

class Syaratdanketentuan extends StatefulWidget {
  const Syaratdanketentuan({super.key});

  @override
  State<Syaratdanketentuan> createState() => _SyaratdanketentuanState();
}

class _SyaratdanketentuanState extends State<Syaratdanketentuan> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Persyaratan Dan Ketentuan",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
              " Dolores officia commodo commodo velit inventore adipiscing dolorem. "
              " Modi fugit iusto quis excepteur do accusamus nulla eiusmod magna illo porro officia elit ad."
              "Magna magna quaerat commodo proident ducimus modi voluptas accusamus culpa ullamco amet inventore. "
              " Duis adipiscing exercitation quos dolorem accusamus quisquam eius. Eius iusto ut sed consequat ducimus "
              "praesentium modi id tempor. Numquam sit ducimus ab iusto magni ut cupiditate cupidatat esse voluptate eos "
              "veritatis. Do porro architecto inventore sunt adipisci sint tempora.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
              " Dolores officia commodo commodo velit inventore adipiscing dolorem. "
              " Modi fugit iusto quis excepteur do accusamus nulla eiusmod magna illo porro officia elit ad."
              "Magna magna quaerat commodo proident ducimus modi voluptas accusamus culpa ullamco amet inventore. "
              " Duis adipiscing exercitation quos dolorem accusamus quisquam eius. Eius iusto ut sed consequat ducimus "
              "praesentium modi id tempor. Numquam sit ducimus ab iusto magni ut cupiditate cupidatat esse voluptate eos "
              "veritatis. Do porro architecto inventore sunt adipisci sint tempora.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
                SizedBox(width: 10),
                Text("Setuju Dengan Persyaratan dan Ketentuan"),
              ],
            ),
            SizedBox(height: 10),
            Text(
              isChecked
                  ? ""
                  : "Untuk melanjutkan harus ceklis kotak persetujuan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
