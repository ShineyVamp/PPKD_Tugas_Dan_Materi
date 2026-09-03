import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/profile_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/api_services.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_button.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_container.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/edit_photo_view.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/edit_profile_view.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/login_view.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ApiService _apiService;
  late Future<ProfileResponse> _profileFuture;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _refreshProfile();
  }

  void _refreshProfile() {
    setState(() {
      _profileFuture = _apiService.getProfile();
    });
  }

  Future<void> _handleLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: NeumorphicContainer(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NeumorphicContainer(
                  shape: BoxShape.circle,
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Icon(Icons.logout_rounded, color: Color(0xFFE53E3E), size: 28),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Konfirmasi Keluar',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Apakah Anda yakin ingin keluar dari akun ini?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () => Navigator.of(context).pop(false),
                        text: 'Batal',
                        isSecondary: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () => Navigator.of(context).pop(true),
                        text: 'Keluar',
                        textColor: const Color(0xFFE53E3E),
                        accentColor: const Color(0xFFE53E3E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (shouldLogout == true) {
      await TokenStorage.clearToken();
      if (!mounted) return;
      context.pushAndRemoveAll(const LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profil Pengguna',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Informasi Akun & Data Pelatihan',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: const Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _refreshProfile,
                        child: const NeumorphicContainer(
                          shape: BoxShape.circle,
                          width: 44,
                          height: 44,
                          child: Center(
                            child: Icon(
                              Icons.refresh_rounded,
                              size: 20,
                              color: Color(0xFF0040E0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _handleLogout,
                        child: const NeumorphicContainer(
                          shape: BoxShape.circle,
                          width: 44,
                          height: 44,
                          child: Center(
                            child: Icon(
                              Icons.logout_rounded,
                              size: 20,
                              color: Color(0xFFE53E3E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              FutureBuilder<ProfileResponse>(
                future: _profileFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 80.0),
                      child: Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(color: Color(0xFF0040E0)),
                            SizedBox(height: 16),
                            Text('Memuat profil...'),
                          ],
                        ),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return NeumorphicContainer(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline_rounded, size: 48, color: Color(0xFFE53E3E)),
                          const SizedBox(height: 16),
                          Text(
                            'Gagal memuat profil',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.error.toString().replaceAll('Exception: ', ''),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(color: const Color(0xFF718096)),
                          ),
                          const SizedBox(height: 20),
                          NeumorphicButton(
                            onTap: _refreshProfile,
                            text: 'Coba Lagi',
                            icon: Icons.refresh_rounded,
                          ),
                        ],
                      ),
                    );
                  }

                  final profile = snapshot.data?.data;
                  if (profile == null) {
                    return NeumorphicContainer(
                      padding: const EdgeInsets.all(24.0),
                      child: const Center(
                        child: Text('Data profil tidak ditemukan.'),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            NeumorphicContainer(
                              shape: BoxShape.circle,
                              width: 130,
                              height: 130,
                              padding: const EdgeInsets.all(6.0),
                              child: ClipOval(
                                child: _buildAvatarImage(profile),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final updated = await context.push(
                                  EditPhotoView(currentPhotoUrl: profile.displayPhotoUrl),
                                );
                                if (updated == true) {
                                  _refreshProfile();
                                }
                              },
                              child: const NeumorphicContainer(
                                shape: BoxShape.circle,
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 18,
                                    color: Color(0xFF0040E0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          profile.name ?? 'Pengguna',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Center(
                        child: Text(
                          profile.email ?? '-',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF718096),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: NeumorphicButton(
                              onTap: () async {
                                final updated = await context.push(
                                  EditProfileView(currentName: profile.name ?? ''),
                                );
                                if (updated == true) {
                                  _refreshProfile();
                                }
                              },
                              text: 'Edit Nama',
                              icon: Icons.edit_rounded,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: NeumorphicButton(
                              onTap: () async {
                                final updated = await context.push(
                                  EditPhotoView(currentPhotoUrl: profile.profilePhoto),
                                );
                                if (updated == true) {
                                  _refreshProfile();
                                }
                              },
                              text: 'Ubah Foto',
                              icon: Icons.image_rounded,
                              isSecondary: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      NeumorphicContainer(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _buildInfoTile(
                              icon: Icons.badge_outlined,
                              label: 'User ID',
                              value: '#${profile.id ?? '-'}',
                            ),
                            const Divider(color: Color(0xFFCBD5E0), height: 24),
                            _buildInfoTile(
                              icon: Icons.email_outlined,
                              label: 'Alamat Email',
                              value: profile.email ?? '-',
                            ),
                            const Divider(color: Color(0xFFCBD5E0), height: 24),
                            _buildInfoTile(
                              icon: Icons.person_outline_rounded,
                              label: 'Nama Lengkap',
                              value: profile.name ?? '-',
                            ),
                            if (profile.jenisKelamin != null) ...[
                              const Divider(color: Color(0xFFCBD5E0), height: 24),
                              _buildInfoTile(
                                icon: Icons.wc_rounded,
                                label: 'Jenis Kelamin',
                                value: profile.jenisKelamin == 'L' ? 'Laki-laki' : 'Perempuan',
                              ),
                            ],
                            if (profile.trainingTitle != null || profile.trainingId != null) ...[
                              const Divider(color: Color(0xFFCBD5E0), height: 24),
                              _buildInfoTile(
                                icon: Icons.school_outlined,
                                label: 'Program Pelatihan',
                                value: profile.trainingTitle ?? 'ID: ${profile.trainingId}',
                              ),
                            ],
                            if (profile.batchId != null) ...[
                              const Divider(color: Color(0xFFCBD5E0), height: 24),
                              _buildInfoTile(
                                icon: Icons.group_work_outlined,
                                label: 'Batch Pelatihan',
                                value: 'Batch ${profile.batchId}',
                              ),
                            ],
                            const Divider(color: Color(0xFFCBD5E0), height: 24),
                            _buildInfoTile(
                              icon: Icons.calendar_today_outlined,
                              label: 'Terdaftar Sejak',
                              value: _formatDate(profile.createdAt),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarImage(ProfileData profile) {
    if (profile.isBase64Photo) {
      try {
        final base64String = profile.profilePhoto!.split(',').last;
        final bytes = base64Decode(base64String);
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildAvatarFallback(profile.name),
        );
      } catch (_) {}
    }

    final photoUrl = profile.displayPhotoUrl;
    if (photoUrl != null && photoUrl.isNotEmpty) {
      return Image.network(
        photoUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildAvatarFallback(profile.name),
      );
    }

    return _buildAvatarFallback(profile.name);
  }

  Widget _buildAvatarFallback(String? name) {
    final initials = name != null && name.trim().isNotEmpty
        ? name.trim().substring(0, 1).toUpperCase()
        : 'U';
    return Container(
      color: const Color(0xFFCBD5E0),
      child: Center(
        child: Text(
          initials,
          style: GoogleFonts.inter(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0040E0),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        NeumorphicContainer(
          shape: BoxShape.circle,
          width: 36,
          height: 36,
          child: Center(
            child: Icon(icon, size: 18, color: const Color(0xFF0040E0)),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF718096),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return '-';
    try {
      final parsed = DateTime.parse(rawDate);
      return '${parsed.day.toString().padLeft(2, '0')}/${parsed.month.toString().padLeft(2, '0')}/${parsed.year}';
    } catch (_) {
      return rawDate;
    }
  }
}
