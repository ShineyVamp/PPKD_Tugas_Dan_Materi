import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6FlutterState();
}

bool isChecked = false;

class _Tugas6FlutterState extends State<Tugas6Flutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/22.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/Logo.png"), width: 130),
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
                          style: TextStyle(fontSize: 14, fontFamily: 'inter'),
                        ),
                        Expanded(child: Divider(color: Color(0xffEDF1F3))),
                      ],
                    ),
                    SizedBox(height: 26),
                    fieldInputUser("Loisbecket@gmail.com", "Email"),
                    SizedBox(height: 16),
                    fieldInputUser("*******", "Password"),
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
                              borderRadius: BorderRadiusGeometry.circular(2),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shape: DecoratedOutlinedBorder(
                          shadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              color: Color.fromRGBO(55, 93, 251, 1),
                            ),
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
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 111,
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
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
    );
  }

  Column fieldInputUser(String init, String text) {
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
