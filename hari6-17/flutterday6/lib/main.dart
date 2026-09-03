import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/services/preference_handler11.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/login_view.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/profile_view.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("id_ID", null);
  await PreferenceHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 16 Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE0E5EC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0040E0)),
      ),
      home: FutureBuilder<String?>(
        future: TokenStorage.getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Color(0xFFE0E5EC),
              body: Center(
                child: CircularProgressIndicator(color: Color(0xFF0040E0)),
              ),
            );
          }
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return const ProfileView();
          }
          return const LoginView();
        },
      ),
    );
  }
}
