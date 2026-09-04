import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/api_services.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_button.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_container.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_text_field.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileView extends StatefulWidget {
  final String currentName;

  const EditProfileView({super.key, required this.currentName});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final ApiService _apiService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    final dio = createDioClient();
    _apiService = ApiService(dio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await _apiService.updateProfile(
        name: _nameController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF38A169),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Text(
            response.message ?? 'Nama profil berhasil diperbarui!',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );

      context.pop(true);
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
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(false),
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
                      'Ubah Profil',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                NeumorphicContainer(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const NeumorphicContainer(
                            shape: BoxShape.circle,
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(
                                Icons.edit_note_rounded,
                                color: Color(0xFF0040E0),
                                size: 22,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Edit Informasi Nama',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2D3748),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      NeumorphicTextField(
                        controller: _nameController,
                        labelText: 'Nama Baru',
                        hintText: 'Masukkan nama lengkap baru',
                        prefixIcon: Icons.person_outline_rounded,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      NeumorphicButton(
                        onTap: _isLoading ? null : _handleSave,
                        text: 'Simpan Perubahan',
                        icon: Icons.check_circle_outline_rounded,
                        isLoading: _isLoading,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 16),
                      NeumorphicButton(
                        onTap: () => context.pop(false),
                        text: 'Batal',
                        isSecondary: true,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
