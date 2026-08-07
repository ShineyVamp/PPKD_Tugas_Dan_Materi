import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutterday6/day_18/database/db_helper.dart';
import 'package:flutterday6/day_18/model/user_login_model.dart';
import 'package:flutterday6/day_18/views/pagelogout.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginDay18SqlFlite extends StatefulWidget {
  const LoginDay18SqlFlite({super.key});

  @override
  State<LoginDay18SqlFlite> createState() => _LoginDay18SqlFliteState();
}

bool isChecked = false;

class _LoginDay18SqlFliteState extends State<LoginDay18SqlFlite> {
  // Controller untuk membaca dan mengontrol isi field input email.
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void register() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UserModelSQL(email: user, password: pass);

    bool success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  void login() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    if (pengguna != null) {
      context.pushAndRemoveAll(Tambahday18());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ), // SnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/22.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/Logo.png"),
                    width: 130,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 26, left: 24, right: 24),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        GradientText(
                          "Get Started Now",
                          colors: [
                            Color(0xff4983F6),
                            Color(0xffC175F5),
                            Color(0xffFBACB7),
                          ],
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Create an account or log in to explore our app",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(400),
                          ),
                        ),
                        SizedBox(height: 24),
                        buttonLogin3rd("assets/images/google.png", "Google"),
                        SizedBox(height: 12),
                        buttonLogin3rd(
                          "assets/images/2021_Facebook_icon 1.png",
                          "Facebook",
                        ),
                        SizedBox(height: 26),
                        Row(
                          spacing: 16,
                          children: [
                            Expanded(child: Divider(color: Color(0xffEDF1F3))),
                            Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'inter',
                              ),
                            ),
                            Expanded(child: Divider(color: Color(0xffEDF1F3))),
                          ],
                        ),
                        SizedBox(height: 26),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!value.contains('@')) {
                              return "Email tidak valid";
                            }
                            return null;
                          },

                          controller: emailC,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.black38),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 8) {
                              return "Password kurang dari 8 karakter";
                            }
                            return null;
                          },
                          controller: passwordC,
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black38),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // fieldInputUser("*******", "Password"),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(
                              height: 19,
                              width: 19,
                              child: Checkbox(
                                activeColor: Color(0xff4D81E7),
                                side: BorderSide(
                                  color: Color(0xff6C7278),
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    2,
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? true;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 9),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 14,
                                fontWeight: FontWeight(500),
                                color: Color(0xff6C7278),
                              ),
                            ),
                            SizedBox(width: 67),
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 14,
                                fontWeight: FontWeight(600),
                                color: Color(0xff4D81E7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        buttonLoginRegister(
                          context,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          teks: "Login",
                        ),
                        SizedBox(height: 10),
                        buttonLoginRegister(
                          context,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              register();
                            }
                          },
                          teks: "Register",
                        ),
                        SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff6C7278),
                              fontWeight: FontWeight(500),
                              fontSize: 14,
                            ),
                            children: [
                              WidgetSpan(child: SizedBox(width: 6)),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff4D81E7),
                                  fontWeight: FontWeight(600),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buttonLoginRegister(
    BuildContext context, {
    required void Function()? onPressed,
    required String teks,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300, 60),
        elevation: 1,
        shape: DecoratedOutlinedBorder(
          shadow: [
            BoxShadow(spreadRadius: 1, color: Color.fromRGBO(55, 93, 251, 1)),
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Color.fromRGBO(37, 62, 167, 0.48),
            ),
          ],
          child: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              width: 1,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        backgroundColor: Color(0xff1D61E7),
        shadowColor: Colors.black,
      ),
      onPressed: onPressed,
      // () {
      //   // PreferenceHandler.setLogin(true);
      //   // context.push(Tugas8flutter());
      // },
      child: Text(teks, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  ElevatedButton buttonLogin3rd(String path, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        overlayColor: Color.fromARGB(255, 230, 227, 225),
        padding: EdgeInsets.all(14),
        backgroundColor: Colors.white,
        shape: DecoratedOutlinedBorder(
          innerShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, -3),
              color: Color.fromRGBO(244, 245, 250, 0.6),
            ),
          ],
          child: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
            side: BorderSide(color: Color(0xffEFF0F6), width: 1),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(path), height: 20),
          SizedBox(width: 10),
          Text(
            "Sign in with $text",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'inter',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class FieldTextInputUser extends StatelessWidget {
  final String text;
  final String init;
  const FieldTextInputUser({super.key, required this.text, required this.init});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        TextFormField(
          initialValue: init,
          style: TextStyle(
            fontWeight: FontWeight(500),
            fontFamily: 'inter',
            fontSize: 16,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffEDF1F3)),
            ),
          ),
        ),
      ],
    );
  }
}
