import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/api_services.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_button.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_container.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/components/neumorphic_text_field.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditPhotoView extends StatefulWidget {
  final String? currentPhotoUrl;

  const EditPhotoView({
    super.key,
    this.currentPhotoUrl,
  });

  @override
  State<EditPhotoView> createState() => _EditPhotoViewState();
}

class _EditPhotoViewState extends State<EditPhotoView> {
  late final ApiService _apiService;
  final _base64Controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final List<Map<String, String>> _presets = [
    {
      'title': 'Royal Blue',
      'color': '0xFF0040E0',
      'base64': 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGElEQVR4nGNgcHjwnyI8asCoAaMGDBcDAG4THx/u4XrmAAAAAElFTkSuQmCC',
    },
    {
      'title': 'Sky Cyan',
      'color': '0xFF0EA5E9',
      'base64': 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGklEQVR4nGPgW/ryPyWYYdSAUQNGDRguBgAAn9ebH9jK7C4AAAAASUVORK5CYII=',
    },
    {
      'title': 'Amethyst Purple',
      'color': '0xFF8B5CF6',
      'base64': 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGUlEQVR4nGPojvn2nxLMMGrAqAGjBgwXAwBAItwfsOwq2AAAAABJRU5ErkJggg==',
    },
    {
      'title': 'Emerald Green',
      'color': '0xFF10B981',
      'base64': 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGUlEQVR4nGMQ2Nn4nxLMMGrAqAGjBgwXAwBHHUkf1AtOXwAAAABJRU5ErkJggg==',
    },
  ];

  late String _selectedBase64;
  int _selectedPresetIndex = -1;
  bool _isLoading = false;
  String? _pickedFileName;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _selectedBase64 = '';
    _base64Controller.text = _selectedBase64;
  }

  @override
  void dispose() {
    _base64Controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (picked == null) return;

      final bytes = await picked.readAsBytes();
      final ext = picked.name.split('.').last.toLowerCase();
      final mime = ext == 'jpg' || ext == 'jpeg' ? 'jpeg' : 'png';
      final base64String = 'data:image/$mime;base64,${base64Encode(bytes)}';

      setState(() {
        _selectedBase64 = base64String;
        _base64Controller.text = base64String;
        _selectedPresetIndex = -1;
        _pickedFileName = picked.name;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF38A169),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Text(
            'Gambar berhasil dipilih: ${picked.name}',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFE53E3E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Text(
            'Gagal memilih gambar: $e',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
  }

  Future<void> _handleUpload() async {
    final photoData = _base64Controller.text.trim();
    if (photoData.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFE53E3E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Text(
            'Pilih gambar dari perangkat atau preset terlebih dahulu',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _apiService.updateProfilePhoto(
        profilePhoto: photoData,
      );

      if (!mounted) return;

      final message = response['message']?.toString() ?? 'Foto profil berhasil diperbarui!';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF38A169),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Text(
            message,
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    'Ubah Foto Profil',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Center(
                child: Column(
                  children: [
                    NeumorphicContainer(
                      shape: BoxShape.circle,
                      width: 130,
                      height: 130,
                      padding: const EdgeInsets.all(6.0),
                      child: ClipOval(
                        child: _buildPreviewImage(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _selectedBase64.isNotEmpty ? 'Pratinjau Foto Baru' : 'Foto Saat Ini',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF718096),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (_pickedFileName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        _pickedFileName!,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: const Color(0xFF0040E0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 28),
              NeumorphicContainer(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unggah dari Perangkat',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pilih file foto dari galeri HP atau ambil foto baru langsung dengan kamera:',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF718096),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: NeumorphicButton(
                            onTap: () => _pickImage(ImageSource.gallery),
                            text: 'Galeri',
                            icon: Icons.photo_library_rounded,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: NeumorphicButton(
                            onTap: () => _pickImage(ImageSource.camera),
                            text: 'Kamera',
                            icon: Icons.camera_alt_rounded,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              NeumorphicContainer(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Atau Pilih Preset Avatar',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_presets.length, (index) {
                        final preset = _presets[index];
                        final isSelected = _selectedPresetIndex == index;
                        final colorInt = int.parse(preset['color']!);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPresetIndex = index;
                              _selectedBase64 = preset['base64']!;
                              _base64Controller.text = _selectedBase64;
                              _pickedFileName = null;
                            });
                          },
                          child: Column(
                            children: [
                              NeumorphicContainer(
                                shape: BoxShape.circle,
                                width: 50,
                                height: 50,
                                isRecessed: isSelected,
                                padding: const EdgeInsets.all(4.0),
                                border: isSelected
                                    ? Border.all(color: Color(colorInt), width: 2.5)
                                    : null,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(colorInt),
                                    shape: BoxShape.circle,
                                  ),
                                  child: isSelected
                                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                preset['title']!.split(' ').first,
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? const Color(0xFF0040E0) : const Color(0xFF718096),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              NeumorphicContainer(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Atau Input String Base64',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 14),
                    NeumorphicTextField(
                      controller: _base64Controller,
                      labelText: 'Kode Base64 Gambar',
                      hintText: 'data:image/png;base64,...',
                      prefixIcon: Icons.code_rounded,
                      maxLines: 3,
                      onChanged: (val) {
                        setState(() {
                          _selectedBase64 = val;
                          _selectedPresetIndex = -1;
                          _pickedFileName = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              NeumorphicButton(
                onTap: _isLoading ? null : _handleUpload,
                text: 'Perbarui Foto Profil',
                icon: Icons.cloud_upload_outlined,
                isLoading: _isLoading,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewImage() {
    if (_selectedBase64.isNotEmpty) {
      try {
        final clean = _selectedBase64.contains(',')
            ? _selectedBase64.split(',').last
            : _selectedBase64;
        final bytes = base64Decode(clean);
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildFallback(),
        );
      } catch (_) {}
    }

    if (widget.currentPhotoUrl != null && widget.currentPhotoUrl!.isNotEmpty) {
      final photo = widget.currentPhotoUrl!.trim();
      if (photo.startsWith('data:image')) {
        try {
          final clean = photo.split(',').last;
          final bytes = base64Decode(clean);
          return Image.memory(
            bytes,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => _buildFallback(),
          );
        } catch (_) {}
      } else if (photo.startsWith('http')) {
        return Image.network(
          photo,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildFallback(),
        );
      } else {
        final clean = photo.startsWith('/') ? photo.substring(1) : photo;
        return Image.network(
          'https://appabsensi.mobileprojp.com/public/$clean',
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildFallback(),
        );
      }
    }

    return _buildFallback();
  }

  Widget _buildFallback() {
    return Container(
      color: const Color(0xFFCBD5E0),
      child: const Center(
        child: Icon(Icons.person_rounded, size: 50, color: Color(0xFF0040E0)),
      ),
    );
  }
}
