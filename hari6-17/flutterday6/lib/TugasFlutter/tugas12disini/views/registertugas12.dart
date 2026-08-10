import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas12disini/database/db_helper.dart';
import 'package:flutterday6/TugasFlutter/tugas12disini/model/user_model.dart';
import 'package:flutterday6/TugasFlutter/tugas12disini/views/logintugas12.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Registertugas12 extends StatefulWidget {
  const Registertugas12({super.key});

  @override
  State<Registertugas12> createState() => _Registertugas12State();
}

class _Registertugas12State extends State<Registertugas12> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController noHpC = TextEditingController();
  final TextEditingController asalKotaC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController konpassC = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool lihatPass = true;

  void register() async {
    final nama = namaC.text.trim();
    final email = emailC.text.trim();
    final noHp = noHpC.text.trim();
    final asalKota = asalKotaC.text.trim();
    final pass = passC.text.trim();

    final pengguna = await UserSQLModel(nama: nama, email: email, noHp: noHp, password: pass, asalKota: asalKota);

    bool success = await DbHelper().userRegister(pengguna);

    if(!mounted) return;

    if(success){
      context.push(Logintugas12());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Berhasil Silahkan Login")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Sudah Terdaftar")));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/tuags12/Rlogos.png", width: 30),
            SizedBox(width: 10),
            Text("RENJANA", style: GoogleFonts.dmSerifDisplay(fontSize: 25)),
          ],
        ),
        backgroundColor: Color(0xffF4F0E7),
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color(0xffF4F0E7),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 32),
                  ),
                  // SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    child: Divider(thickness: 2, color: Color(0xffC9362B)),
                  ),
                  Text(
                    "Lengkapi data dibawah ini \nuntuk mulai penjelajahan nusantara anda.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Nama",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        namaC: namaC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Nama Wajib Diisi";
                          }
                          return null;
                        },
                        teksHint: 'Masukkan Nama Anda',
                        bintang: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        " Email",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        namaC: emailC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Email Wajib Diisi";
                          } else if (!p0.contains('@')) {
                            return "Email Tidak Valid";
                          }
                          return null;
                        },
                        teksHint: 'Masukkan Nama Anda',
                        bintang: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        " No Hp.",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        namaC: noHpC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Nomor Wajib Diisi";
                          } else if (int.tryParse(p0) == null) {
                            return "Nomor Wajib Angka";
                          }
                          return null;
                        },
                        teksHint: 'Masukkan Nomor Anda',
                        bintang: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        " Asal Kota",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        namaC: asalKotaC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Asal Kota Wajib Diisi";
                          }
                          return null;
                        },
                        teksHint: 'Masukkan Asal Kota Anda',
                        bintang: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        " Password",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {});
                            lihatPass = !lihatPass;
                          },
                          child: Icon(
                            lihatPass ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        namaC: passC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Password Wajib Diisi";
                          } else if(p0.length < 8){
                            return "Password Minimal 8 Karakter";
                          }
                          return null;
                        },
                        teksHint: 'Masukkan Password Anda',
                        bintang: lihatPass,
                      ),
                      SizedBox(height: 10),
                      Text(
                        " Konfirmasi Password",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      MasukkanPengguna(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {});
                            lihatPass = !lihatPass;
                          },
                          child: Icon(
                            lihatPass ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        namaC: konpassC,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Nama Wajib Diisi";
                          } else if (!p0.contains(passC.text)){
                            return "Password Tidak Sama";
                          }
                          return null;
                        },
                        teksHint: 'Konfirmasi Password Anda',
                        bintang: lihatPass,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 55),
                          elevation: 1,
                          shape: DecoratedOutlinedBorder(
                            child: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          backgroundColor: Color(0xffC9362B),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {}
                          register();
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
