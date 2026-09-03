import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/api_services.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_button.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_container.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_text_field.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/profile_view.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/register_view.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final ApiService _apiService;
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _isCheckingToken = true;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _checkExistingToken();
  }

  Future<void> _checkExistingToken() async {
    final token = await TokenStorage.getToken();
    if (token != null && token.isNotEmpty) {
      if (!mounted) return;
      context.pushReplacement(const ProfileView());
      return;
    }
    if (mounted) {
      setState(() => _isCheckingToken = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await _apiService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF38A169),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Text(
            response.message ?? 'Login berhasil!',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );

      context.pushReplacement(const ProfileView());
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFE53E3E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Text(
            e.toString().replaceAll('Exception: ', ''),
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingToken) {
      return const Scaffold(
        backgroundColor: Color(0xFFE0E5EC),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF0040E0)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NeumorphicContainer(
                    shape: BoxShape.circle,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 52,
                        color: Color(0xFF0040E0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Selamat Datang',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Masuk ke akun Anda untuk melanjutkan',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF718096),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 36),
                  NeumorphicContainer(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        NeumorphicTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          hintText: 'nama@example.com',
                          prefixIcon: Icons.mail_outline_rounded,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email wajib diisi';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Format email tidak valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        NeumorphicTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: '••••••••',
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF718096),
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password wajib diisi';
                            }
                            if (value.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 28),
                        NeumorphicButton(
                          onTap: _isLoading ? null : _handleLogin,
                          text: 'Masuk',
                          icon: Icons.door_back_door,
                          isLoading: _isLoading,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum memiliki akun? ',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF718096),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(const RegisterView());
                        },
                        child: Text(
                          'Daftar Sekarang',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0040E0),
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
