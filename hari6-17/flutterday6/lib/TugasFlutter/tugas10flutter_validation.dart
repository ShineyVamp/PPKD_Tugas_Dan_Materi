import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas10page/home_abalagi.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:lottie/lottie.dart';

class Tugas10flutterValidation extends StatefulWidget {
  const Tugas10flutterValidation({super.key});

  @override
  State<Tugas10flutterValidation> createState() =>
      _Tugas10flutterValidationState();
}

class _Tugas10flutterValidationState extends State<Tugas10flutterValidation> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController asalController = TextEditingController();
  List<String> errors = [];
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pendaftaran Anggota"), centerTitle: true),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              txtFrmFld(namaController, "Masukkan Nama Anda"),
              SizedBox(height: 10),
              Text(
                "Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              txtFrmFld(emailController, "Masukkan Email Anda"),
              SizedBox(height: 10),
              Text(
                "Nomor",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              txtFrmFld(nomorController, "Masukkan Nomor Anda"),
              SizedBox(height: 10),
              Text(
                "Daerah Asal",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              txtFrmFld(asalController, "Masukkan Asal Daerah Anda"),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  onPressed: () {
                    errors.clear();
                    if (_formkey.currentState!.validate()) {
                      context.push(
                        HomeAbalagi(
                          nama: namaController.text,
                          email: emailController.text,
                          nomor: nomorController.text,
                          asal: asalController.text,
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Gagal!"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LottieBuilder.asset(
                                "assets/animations/Incorrect.json",
                              ),
                              Text(
                                errors.join('\n'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  context.pop();
                                });
                              },
                              child: Text("yahh"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text("Daftar", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField txtFrmFld(TextEditingController data, String hint) {
    return TextFormField(
      onChanged: (value) {
        setState(() {});
      },
      controller: data,
      validator: data == namaController
          ? (value) {
              if (value == null || value.isEmpty) {
                errors.add("Nama Anda Masih Kosong");
                return "Nama Tidak Boleh Kosong";
              }
              return null;
            }
          : data == emailController
          ? (value) {
              if (value == null || value.isEmpty) {
                errors.add("Email Anda Masih Kosong");
                return "Email Tidak Boleh Kosong";
              } else if (!value.contains("@")) {
                errors.add("Email Anda Tidak Valid");
                return "Masukkan Email Valod";
              }
              return null;
            }
          : data == nomorController
          ? (value) {
              return null;
            }
          : (value) {
              if (value == null || value.isEmpty) {
                errors.add("Asal Daerah Anda Masih Kosong");
                return "Masukkan Daerah Asal Anda";
              }
              return null;
            },
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
