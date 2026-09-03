import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/batch_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/training_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/api_services.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_button.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_container.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_text_field.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/profile_view.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final ApiService _apiService;

  String _jenisKelamin = 'L';
  int? _selectedTrainingId;
  int? _selectedBatchId;

  List<TrainingData> _trainings = [];
  List<BatchData> _batches = [];
  bool _isLoadingInitialData = true;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _loadInitialData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    try {
      final results = await Future.wait([
        _apiService.getTrainings(),
        _apiService.getBatches(),
      ]);

      final trainingRes = results[0] as TrainingResponse;
      final batchRes = results[1] as BatchResponse;

      setState(() {
        _trainings = trainingRes.data ?? [];
        _batches = batchRes.data ?? [];
        if (_trainings.isNotEmpty) {
          _selectedTrainingId = _trainings.first.id;
        }
        if (_batches.isNotEmpty) {
          _selectedBatchId = _batches.first.id;
        }
        _isLoadingInitialData = false;
      });
    } catch (_) {
      setState(() {
        _isLoadingInitialData = false;
        _selectedTrainingId = 1;
        _selectedBatchId = 1;
      });
    }
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedTrainingId == null) {
      _showSnackbar('Silakan pilih program pelatihan', isError: true);
      return;
    }
    if (_selectedBatchId == null) {
      _showSnackbar('Silakan pilih batch pelatihan', isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _apiService.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        jenisKelamin: _jenisKelamin,
        profilePhoto: '',
        batchId: _selectedBatchId!,
        trainingId: _selectedTrainingId!,
      );

      final token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
        if (!mounted) return;
        _showSnackbar(response.message ?? 'Registrasi berhasil!');
        context.pushAndRemoveAll(const ProfileView());
      } else {
        if (!mounted) return;
        _showSnackbar('Registrasi berhasil, silakan masuk dengan akun Anda.');
        context.pop();
      }
    } catch (e) {
      if (!mounted) return;
      _showSnackbar(e.toString().replaceAll('Exception: ', ''), isError: true);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? const Color(0xFFE53E3E) : const Color(0xFF38A169),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Text(
          message,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: SafeArea(
        child: _isLoadingInitialData
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF0040E0)),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: const NeumorphicContainer(
                              shape: BoxShape.circle,
                              width: 44,
                              height: 44,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 18,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Daftar Akun Baru',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF2D3748),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      NeumorphicContainer(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NeumorphicTextField(
                              controller: _nameController,
                              labelText: 'Nama Lengkap',
                              hintText: 'Budi Santoso',
                              prefixIcon: Icons.person_outline_rounded,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Nama lengkap wajib diisi';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            NeumorphicTextField(
                              controller: _emailController,
                              labelText: 'Alamat Email',
                              hintText: 'budi@example.com',
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
                            const SizedBox(height: 18),
                            NeumorphicTextField(
                              controller: _passwordController,
                              labelText: 'Kata Sandi',
                              hintText: 'Minimal 6 karakter',
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
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Jenis Kelamin',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4A5568),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => _jenisKelamin = 'L'),
                                    child: NeumorphicContainer(
                                      isRecessed: _jenisKelamin == 'L',
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      borderRadius: BorderRadius.circular(16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.male_rounded,
                                            color: _jenisKelamin == 'L'
                                                ? const Color(0xFF0040E0)
                                                : const Color(0xFF718096),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Laki-laki',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: _jenisKelamin == 'L'
                                                  ? const Color(0xFF0040E0)
                                                  : const Color(0xFF718096),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => _jenisKelamin = 'P'),
                                    child: NeumorphicContainer(
                                      isRecessed: _jenisKelamin == 'P',
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      borderRadius: BorderRadius.circular(16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.female_rounded,
                                            color: _jenisKelamin == 'P'
                                                ? const Color(0xFF0040E0)
                                                : const Color(0xFF718096),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Perempuan',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: _jenisKelamin == 'P'
                                                  ? const Color(0xFF0040E0)
                                                  : const Color(0xFF718096),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Program Pelatihan',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4A5568),
                                ),
                              ),
                            ),
                            NeumorphicContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                              borderRadius: BorderRadius.circular(18),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  value: _selectedTrainingId,
                                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF718096)),
                                  items: _trainings.map((t) {
                                    return DropdownMenuItem<int>(
                                      value: t.id,
                                      child: Text(
                                        t.title ?? 'Pelatihan #${t.id}',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: const Color(0xFF2D3748),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() => _selectedTrainingId = val);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Batch Pelatihan',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4A5568),
                                ),
                              ),
                            ),
                            NeumorphicContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                              borderRadius: BorderRadius.circular(18),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  value: _selectedBatchId,
                                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF718096)),
                                  items: _batches.map((b) {
                                    return DropdownMenuItem<int>(
                                      value: b.id,
                                      child: Text(
                                        'Batch ${b.batchKe ?? b.id}',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: const Color(0xFF2D3748),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() => _selectedBatchId = val);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 28),
                            NeumorphicButton(
                              onTap: _isLoading ? null : _handleRegister,
                              text: 'Daftar',
                              icon: Icons.person_add_alt_1_rounded,
                              isLoading: _isLoading,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun? ',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xFF718096),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: Text(
                                'Masuk di sini',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF0040E0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
