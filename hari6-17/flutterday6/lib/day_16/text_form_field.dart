import 'package:flutter/material.dart';
import 'package:flutterday6/day_16/home_abal.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:lottie/lottie.dart';

class TextFormFieldday16 extends StatefulWidget {
  const TextFormFieldday16({super.key});

  @override
  State<TextFormFieldday16> createState() => _TextFormFieldday16State();
}

class _TextFormFieldday16State extends State<TextFormFieldday16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextField(
              controller: emailController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextField(controller: emailController),
            TextField(controller: emailController),
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "email tidak boleh koson";
                } else if (!value.contains('@')) {
                  return "EMAIL TIDAK VALID";
                }
                return null;
              },
            ),
            TextFormField(
              controller: password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Password kurang";
                }
                return null;
              },
            ),
            TextFormField(
              controller: confirmpassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Password kurang";
                } else if (value != password.text) {
                  return "pass tidak cocok";
                }
                return null;
              },
            ),
            Text(emailController.text, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(password.text);
                print(confirmpassword.text);
                if (_formkey.currentState!.validate()) {
                  // context.push(DrawerDay13());
                  context.push(
                    HomeAbalday19(
                      email: emailController.text,
                      password: password.text,
                    ),
                  );
                } else {
                  print("belu tervalidasi");
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("data"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LottieBuilder.asset(
                            "assets/animations/error.json",
                            // height: 250,
                          ),
                          Text("${emailController.text} tidakj valid"),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text("baiklah"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text("tekan ini"),
            ),
          ],
        ),
      ),
    );
  }
}
