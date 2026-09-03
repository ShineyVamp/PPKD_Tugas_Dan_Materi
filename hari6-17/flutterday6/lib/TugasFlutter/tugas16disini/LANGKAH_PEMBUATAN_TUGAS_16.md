# Panduan Praktis Langkah Demi Langkah Pembuatan Tugas 16 Flutter
## Tutorial Lengkap Membangun Aplikasi Autentikasi & CRUD Profile via API (MobilePro) dengan Desain Neumorphism dari Awal hingga Selesai

Dokumen ini disusun sebagai panduan langkah demi langkah (*step-by-step procedural tutorial*) untuk membangun aplikasi **Tugas 16 Flutter**. Panduan ini mengarahkan Anda secara kronologis dari persiapan dependensi, pembuatan model, layanan jaringan (API & storage), perancangan sistem UI Neumorphism, pembangunan halaman autentikasi dan profil, hingga pengujian akhir.

---

## Daftar Urutan Langkah Pengerjaan
- [Langkah 1: Memahami Endpoint API & Menyiapkan Dependensi (`pubspec.yaml`)](#langkah-1-memahami-endpoint-api--menyiapkan-dependensi-pubspecyaml)
- [Langkah 2: Menyiapkan Struktur Folder Proyek (Referensi `lib/day_33`)](#langkah-2-menyiapkan-struktur-folder-proyek-referensi-libday_33)
- [Langkah 3: Membuat Data Model & Menjalankan Code Generation (`build_runner`)](#langkah-3-membuat-data-model--menjalankan-code-generation-build_runner)
- [Langkah 4: Membangun Layanan Penyimpanan Token Lokal (`token_storage.dart`)](#langkah-4-membangun-layanan-penyimpanan-token-lokal-token_storagedart)
- [Langkah 5: Mengonfigurasi Dio Client & Otomatisasi Header Token (`dio_client.dart`)](#langkah-5-mengonfigurasi-dio-client--otomatisasi-header-token-dio_clientdart)
- [Langkah 6: Mengimplementasikan Seluruh Fungsi API CRUD (`api_services.dart`)](#langkah-6-mengimplementasikan-seluruh-fungsi-api-crud-api_servicesdart)
- [Langkah 7: Membangun Komponen Dasar Desain Neumorphism (`views/components/`)](#langkah-7-membangun-komponen-dasar-desain-neumorphism-viewscomponents)
- [Langkah 8: Membangun Halaman Masuk / Login (`login_view.dart`)](#langkah-8-membangun-halaman-masuk--login-login_viewdart)
- [Langkah 9: Membangun Halaman Pendaftaran / Register (`register_view.dart`)](#langkah-9-membangun-halaman-pendaftaran--register-register_viewdart)
- [Langkah 10: Membangun Dashboard Profil dengan `FutureBuilder` (`profile_view.dart`)](#langkah-10-membangun-dashboard-profil-dengan-futurebuilder-profile_viewdart)
- [Langkah 11: Membangun Halaman Ubah Nama Profil (`edit_profile_view.dart`)](#langkah-11-membangun-halaman-ubah-nama-profil-edit_profile_viewdart)
- [Langkah 12: Membangun Halaman Ubah Foto Profil Base64 (`edit_photo_view.dart`)](#langkah-12-membangun-halaman-ubah-foto-profil-base64-edit_photo_viewdart)
- [Langkah 13: Menghubungkan ke Titik Masuk Utama (`lib/main.dart`) & Konfigurasi Gradle](#langkah-13-menghubungkan-ke-titik-masuk-utama-libmaindart--konfigurasi-gradle)
- [Langkah 14: Pengujian Alur Aplikasi & Verifikasi Kepatuhan Aturan](#langkah-14-pengujian-alur-aplikasi--verifikasi-kepatuhan-aturan)

---

### Langkah 1: Memahami Endpoint API & Menyiapkan Dependensi (`pubspec.yaml`)

#### A. Tujuan
Memastikan kebutuhan paket pustaka terpenuhi dan memetakan endpoint API yang diizinkan dan yang dilarang sesuai petunjuk tugas.

#### B. Pemetaan Endpoint API MobilePro (`https://appabsensi.mobileprojp.com`)
1. **Endpoint yang Digunakan:**
   - `POST /api/register` : Pendaftaran user baru (Nama, Email, Password, Jenis Kelamin, Batch ID, Training ID, Profile Photo).
   - `POST /api/login` : Autentikasi user dan pengambilan *Bearer Token*.
   - `GET /api/profile` : Mengambil data akun terproteksi (Wajib Header `Authorization: Bearer <token>`).
   - `PUT /api/profile` : Memperbarui nama pengguna (Wajib Header `Authorization: Bearer <token>`).
   - `PUT /api/profile/photo` : Memperbarui foto profil via Base64 string (Wajib Header `Authorization: Bearer <token>`).
   - `GET /api/trainings` : Mengambil daftar pelatihan publik untuk dropdown registrasi.
   - `GET /api/batches` : Mengambil daftar batch pelatihan publik untuk dropdown registrasi.
2. **Endpoint yang Dieksklusi (Dilarang Digunakan Sesuai Soal):**
   - `GET /api/users` (All data user) ❌
   - `GET /api/trainings/{id}` (Detail training by ID) ❌

#### C. Penyesuaian `pubspec.yaml`
Pastikan paket berikut ada di dalam `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.11.0                     # Untuk konektivitas HTTP API
  flutter_secure_storage: ^11.0.0  # Untuk menyimpan token secara aman
  shared_preferences: ^2.5.5       # Penyimpanan cadangan token
  google_fonts: ^8.2.0             # Tipografi modern (Inter)
  json_annotation: ^4.12.0         # Anotasi serialisasi JSON

dev_dependencies:
  build_runner: ^2.15.1            # Alat kompilasi generator
  json_serializable: ^6.14.1       # Generator serialisasi JSON
```
Jalankan perintah di terminal untuk mengunduh pustaka:
```bash
flutter pub get
```

---

### Langkah 2: Menyiapkan Struktur Folder Proyek (Referensi `lib/day_33`)

#### A. Tujuan
Menerapkan arsitektur bersih (*Clean Architecture*) berbasis pemisahan tanggung jawab (*Separation of Concerns*).

#### B. Cara Pembuatan
Di dalam folder tugas Anda `lib/TugasFlutter/tugas16disini/`, buat 3 subfolder utama:
1. `models/` : Berisi kelas-kelas representasi data JSON dari server.
2. `services/` : Berisi logika penyimpanan lokal dan komunikasi jaringan HTTP.
3. `views/` : Berisi halaman-halaman antarmuka dan subfolder `components/` untuk elemen UI Neumorphism.

Struktur folder yang terbentuk:
```text
lib/TugasFlutter/tugas16disini/
├── models/
├── services/
└── views/
    └── components/
```

---

### Langkah 3: Membuat Data Model & Menjalankan Code Generation (`build_runner`)

#### A. Tujuan
Membuat representasi tipe data Dart yang aman (*type-safe*) untuk memetakan JSON dari/ke objek aplikasi.

#### B. Pembuatan Berkas Model

1. **Membuat `lib/TugasFlutter/tugas16disini/models/auth_response.dart`**
   ```dart
   import 'package:json_annotation/json_annotation.dart';

   part 'auth_response.g.dart';

   @JsonSerializable()
   class AuthResponse {
     @JsonKey(name: 'message')
     final String? message;

     @JsonKey(name: 'data')
     final AuthData? data;

     AuthResponse({this.message, this.data});

     factory AuthResponse.fromJson(Map<String, dynamic> json) =>
         _$AuthResponseFromJson(json);

     Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
   }

   @JsonSerializable()
   class AuthData {
     @JsonKey(name: 'token')
     final String? token;

     @JsonKey(name: 'user')
     final UserData? user;

     AuthData({this.token, this.user});

     factory AuthData.fromJson(Map<String, dynamic> json) =>
         _$AuthDataFromJson(json);

     Map<String, dynamic> toJson() => _$AuthDataToJson(this);
   }

   @JsonSerializable()
   class UserData {
     @JsonKey(name: 'id')
     final int? id;

     @JsonKey(name: 'name')
     final String? name;

     @JsonKey(name: 'email')
     final String? email;

     @JsonKey(name: 'created_at')
     final String? createdAt;

     UserData({this.id, this.name, this.email, this.createdAt});

     factory UserData.fromJson(Map<String, dynamic> json) =>
         _$UserDataFromJson(json);

     Map<String, dynamic> toJson() => _$UserDataToJson(this);
   }
   ```
   *Penjelasan:* Model ini menangani respons balasan dari login dan registrasi. Objek `AuthData` menyimpan kunci otentikasi `token` yang akan disimpan di penyimpanan lokal ponsel.

2. **Membuat `lib/TugasFlutter/tugas16disini/models/profile_response.dart`**
   ```dart
   import 'package:json_annotation/json_annotation.dart';

   part 'profile_response.g.dart';

   @JsonSerializable()
   class ProfileResponse {
     @JsonKey(name: 'message')
     final String? message;

     @JsonKey(name: 'data')
     final ProfileData? data;

     ProfileResponse({this.message, this.data});

     factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
         _$ProfileResponseFromJson(json);

     Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
   }

   @JsonSerializable()
   class ProfileData {
     @JsonKey(name: 'id')
     final int? id;

     @JsonKey(name: 'name')
     final String? name;

     @JsonKey(name: 'email')
     final String? email;

     @JsonKey(name: 'profile_photo')
     final String? profilePhoto;

     @JsonKey(name: 'jenis_kelamin')
     final String? jenisKelamin;

     @JsonKey(name: 'batch_id')
     final int? batchId;

     @JsonKey(name: 'training_id')
     final int? trainingId;

     @JsonKey(name: 'training_title')
     final String? trainingTitle;

     @JsonKey(name: 'created_at')
     final String? createdAt;

     ProfileData({
       this.id,
       this.name,
       this.email,
       this.profilePhoto,
       this.jenisKelamin,
       this.batchId,
       this.trainingId,
       this.trainingTitle,
       this.createdAt,
     });

     factory ProfileData.fromJson(Map<String, dynamic> json) =>
         _$ProfileDataFromJson(json);

     Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
   }
   ```
   *Penjelasan:* `@JsonKey(name: 'profile_photo')` memetakan nama atribut JSON dari server ke variabel `profilePhoto` di Dart.

3. **Membuat `training_response.dart` & `batch_response.dart`**
   - `TrainingResponse` memetakan array list pelatihan publik (`GET /api/trainings`) dengan atribut `id` dan `title`.
   - `BatchResponse` memetakan array list batch pelatihan (`GET /api/batches`) dengan atribut `id`, `batch_ke`, `start_date`, dan `end_date`.

#### C. Menjalankan Generator Kode
Buka terminal dan jalankan perintah berikut untuk meng-generate file `*.g.dart`:
```bash
dart run build_runner build
```
Perintah ini akan secara otomatis menghasilkan:
- `auth_response.g.dart`
- `profile_response.g.dart`
- `training_response.g.dart`
- `batch_response.g.dart`

---

### Langkah 4: Membangun Layanan Penyimpanan Token Lokal (`token_storage.dart`)

#### A. Tujuan
Menyimpan *Bearer Token* secara permanen di ponsel agar pengguna tidak perlu login ulang saat aplikasi ditutup dan dibuka kembali.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/services/token_storage.dart`
```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _tokenKey = 'tugas16_auth_token';

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  static Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
    } catch (_) {}
  }

  static Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      if (token != null && token.isNotEmpty) {
        return token;
      }
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
    } catch (_) {}
  }
}
```

#### C. Penjelasan Logika
- Menggunakan pendekatan *Hybrid Storage*: Pertama mencoba menulis/membaca ke `FlutterSecureStorage` (penyimpanan terenkripsi). Jika terjadi limitasi pada versi sistem operasi tertentu, secara otomatis fallback menggunakan `SharedPreferences`.
- Metode bersifat `static`, sehingga mempermudah pemanggilan `TokenStorage.saveToken(token)` dari mana pun tanpa instansiasi ulang.

---

### Langkah 5: Mengonfigurasi Dio Client & Otomatisasi Header Token (`dio_client.dart`)

#### A. Tujuan
Menyediakan instans HTTP Dio dengan pengaturan base URL, batas waktu (timeout), serta *interceptor* yang secara otomatis menyisipkan Bearer Token pada setiap request yang membutuhkan otorisasi.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/services/dio_client.dart`
```dart
import 'package:dio/dio.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://appabsensi.mobileprojp.com',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );

  return dio;
}
```

#### C. Penjelasan Logika
- `BaseOptions`: Menetapkan alamat server utama `https://appabsensi.mobileprojp.com` sehingga pada pemanggilan API berikutnya kita cukup menuliskan path relatif (misal: `/api/profile`).
- `InterceptorsWrapper.onRequest`: Berfungsi mencegat request tepat sebelum dikirimkan ke jaringan. Fungsi ini memeriksa apakah ada token di `TokenStorage`. Jika ada, header `Authorization: Bearer <token>` otomatis ditambahkan. Ini mengeliminasi penulisan manual token di setiap request.

---

### Langkah 6: Mengimplementasikan Seluruh Fungsi API CRUD (`api_services.dart`)

#### A. Tujuan
Menyediakan satu kelas layanan (`ApiService`) yang membungkus semua panggilan endpoint HTTP untuk Registrasi, Login, Profile, Update Profile, Update Foto, serta pengambilan data Pelatihan dan Batch.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/services/api_services.dart`
```dart
import 'package:dio/dio.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/auth_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/batch_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/profile_response.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/models/training_response.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String jenisKelamin,
    String? profilePhoto,
    required int batchId,
    required int trainingId,
  }) async {
    try {
      final response = await _dio.post(
        '/api/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'jenis_kelamin': jenisKelamin,
          'profile_photo': profilePhoto ?? '',
          'batch_id': batchId,
          'training_id': trainingId,
        },
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<ProfileResponse> getProfile() async {
    try {
      final response = await _dio.get('/api/profile');
      return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<ProfileResponse> updateProfile({required String name}) async {
    try {
      final response = await _dio.put(
        '/api/profile',
        data: {'name': name},
      );
      return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<Map<String, dynamic>> updateProfilePhoto({required String profilePhoto}) async {
    try {
      final response = await _dio.put(
        '/api/profile/photo',
        data: {'profile_photo': profilePhoto},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<TrainingResponse> getTrainings() async {
    try {
      final response = await _dio.get('/api/trainings');
      return TrainingResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<BatchResponse> getBatches() async {
    try {
      final response = await _dio.get('/api/batches');
      return BatchResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  String _extractErrorMessage(DioException e) {
    if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data as Map<String, dynamic>;
      if (data['message'] != null) {
        return data['message'].toString();
      }
      if (data['errors'] != null && data['errors'] is Map) {
        final errors = data['errors'] as Map;
        final firstKey = errors.keys.first;
        final list = errors[firstKey];
        if (list is List && list.isNotEmpty) {
          return list.first.toString();
        }
      }
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Koneksi ke server timeout, periksa jaringan internet Anda.';
    }
    return e.message ?? 'Terjadi kesalahan pada server';
  }
}
```

#### C. Penjelasan Logika
- **Operasi PUT:** `updateProfile` menggunakan `_dio.put('/api/profile')` dan `updateProfilePhoto` menggunakan `_dio.put('/api/profile/photo')` untuk operasi pembaruan data sesuai panduan tugas.
- **Parsing Error Terpusat:** `_extractErrorMessage` membaca respons kegagalan (misalnya validasi server Laravel `errors: {"email": ["Email sudah digunakan"]}`) dan mengubahnya menjadi pesan teks yang mudah dipahami saat ditampilkan via SnackBar.

---

### Langkah 7: Membangun Komponen Dasar Desain Neumorphism (`views/components/`)

#### A. Tujuan
Menciptakan komponen antarmuka yang dapat digunakan berulang kali (*reusable widgets*) dengan gaya Neumorphism (efek bayangan ganda timbul dan cekung).

#### B. Palet Warna & Rumus Bayangan
- Warna latar belakang: `Color(0xFFE0E5EC)`
- Bayangan gelap (kanan bawah): `Color(0xFFA3B1C6)` dengan offset `(6, 6)`
- Bayangan terang (kiri atas): `Colors.white` dengan offset `(-6, -6)`

#### C. Pembuatan Berkas Komponen

1. **`views/components/neumorphic_container.dart` (Kotak Permukaan Neumorphic)**
   ```dart
   class NeumorphicContainer extends StatelessWidget {
     final Widget? child;
     final double? width;
     final double? height;
     final EdgeInsetsGeometry? padding;
     final EdgeInsetsGeometry? margin;
     final BorderRadius? borderRadius;
     final Color backgroundColor;
     final bool isRecessed;
     final BoxShape shape;
     final Border? border;

     const NeumorphicContainer({
       super.key,
       this.child,
       this.width,
       this.height,
       this.padding,
       this.margin,
       this.borderRadius,
       this.backgroundColor = const Color(0xFFE0E5EC),
       this.isRecessed = false,
       this.shape = BoxShape.rectangle,
       this.border,
     });

     @override
     Widget build(BuildContext context) {
       final radius = shape == BoxShape.circle
           ? null
           : (borderRadius ?? BorderRadius.circular(20.0));

       return Container(
         width: width,
         height: height,
         margin: margin,
         padding: padding,
         decoration: BoxDecoration(
           color: backgroundColor,
           shape: shape,
           borderRadius: radius,
           border: border,
           boxShadow: isRecessed
               ? [
                   const BoxShadow(
                     color: Color(0xFFA3B1C6),
                     offset: Offset(2, 2),
                     blurRadius: 4,
                   ),
                   const BoxShadow(
                     color: Colors.white,
                     offset: Offset(-2, -2),
                     blurRadius: 4,
                   ),
                 ]
               : const [
                   BoxShadow(
                     color: Color(0xFFA3B1C6),
                     offset: Offset(6, 6),
                     blurRadius: 12,
                   ),
                   BoxShadow(
                     color: Colors.white,
                     offset: Offset(-6, -6),
                     blurRadius: 12,
                   ),
                 ],
         ),
         child: child,
       );
     }
   }
   ```
   *Penjelasan:* Menjadi dasar dari seluruh kartu, panel, dialog konfirmasi, dan bingkai foto lingkaran (`shape: BoxShape.circle`).

2. **`views/components/neumorphic_button.dart` (Tombol Interaktif Neumorphic)**
   - Menggunakan `GestureDetector` dengan event `onTapDown` dan `onTapUp` untuk mengubah nilai boolean `_isPressed`.
   - Menggunakan `AnimatedContainer` berdurasi 150 milidetik agar saat tombol ditekan, bayangan mengecil (offset 2) menyerupai tombol fisik yang tertekan ke dalam.
   - Dilengkapi parameter `isLoading` yang menampilkan *CircularProgressIndicator* saat request berlangsung.

3. **`views/components/neumorphic_text_field.dart` (Input Form Sunken/Debossed)**
   - Memiliki bayangan cekung ke dalam sehingga tampak seperti bidang ukiran yang siap diketik.
   - Terintegrasi dengan widget `FormField` untuk menampilkan teks pesan validasi merah jika ada input yang tidak memenuhi syarat.

---

### Langkah 8: Membangun Halaman Masuk / Login (`login_view.dart`)

#### A. Tujuan
Menyediakan antarmuka bagi pengguna untuk menginputkan email dan password, memvalidasi form, melakukan request `POST /api/login`, menyimpan token yang didapat, dan berpindah ke dashboard.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/views/login_view.dart`
Struktur alur logikanya adalah sebagai berikut:
```dart
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
    if (mounted) setState(() => _isCheckingToken = false);
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
        SnackBar(content: Text(response.message ?? 'Login berhasil!')),
      );

      context.pushReplacement(const ProfileView());
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
  // build widget UI ...
}
```

#### C. Penjelasan Logika Antarmuka
1. **Validasi:** `_formKey.currentState!.validate()` memvalidasi format email dan memastikan password tidak kosong.
2. **Koneksi:** Mengirim payload via `_apiService.login(...)`.
3. **Penyimpanan Kunci:** Token dari `response.data.token` disimpan menggunakan `TokenStorage.saveToken(token)`.
4. **Navigasi Bersih:** `context.pushReplacement(const ProfileView())` mengganti halaman login dengan dashboard profil pengguna.

---

### Langkah 9: Membangun Halaman Pendaftaran / Register (`register_view.dart`)

#### A. Tujuan
Menyediakan form pendaftaran lengkap: Nama, Email, Password, Pilihan Jenis Kelamin (L/P), Dropdown Pelatihan dari API, dan Dropdown Batch dari API.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/views/register_view.dart`
Alur kunci pemanggilan data dropdown dan registrasinya:
```dart
class _RegisterViewState extends State<RegisterView> {
  // controllers & state variables...
  String _jenisKelamin = 'L';
  int? _selectedTrainingId;
  int? _selectedBatchId;
  List<TrainingData> _trainings = [];
  List<BatchData> _batches = [];
  bool _isLoadingInitialData = true;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final results = await Future.wait([
        _apiService.getTrainings(),
        _apiService.getBatches(),
      ]);
      setState(() {
        _trainings = (results[0] as TrainingResponse).data ?? [];
        _batches = (results[1] as BatchResponse).data ?? [];
        if (_trainings.isNotEmpty) _selectedTrainingId = _trainings.first.id;
        if (_batches.isNotEmpty) _selectedBatchId = _batches.first.id;
        _isLoadingInitialData = false;
      });
    } catch (_) {
      setState(() => _isLoadingInitialData = false);
    }
  }

  Future<void> _handleRegister() async {
    // validasi form, panggil _apiService.register(...)
  }
}
```

#### C. Penjelasan Logika Antarmuka
- `Future.wait`: Memanggil endpoint `GET /api/trainings` dan `GET /api/batches` secara paralel saat halaman dibuka sehingga form dropdown langsung terisi otomatis dengan opsi yang valid dari server.
- Tombol jenis kelamin dibuat menggunakan `NeumorphicContainer` dengan properti `isRecessed: _jenisKelamin == 'L'`, memberikan tampilan timbul untuk yang tidak dipilih dan tampilan cekung untuk opsi yang aktif.

---

### Langkah 10: Membangun Dashboard Profil dengan `FutureBuilder` (`profile_view.dart`)

#### A. Tujuan
Menampilkan data pengguna dari endpoint `GET /api/profile` menggunakan widget **`FutureBuilder`** sesuai syarat wajib pada checklist tugas, serta menyediakan tombol aksi untuk edit profil, ubah foto, refresh, dan logout.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/views/profile_view.dart`
Struktur implementasi `FutureBuilder`:
```dart
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
    // Menampilkan dialog konfirmasi Neumorphic
    // Jika ya -> panggil TokenStorage.clearToken() dan navigasi ke LoginView()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: FutureBuilder<ProfileResponse>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final profile = snapshot.data?.data;
          if (profile == null) {
            return const Center(child: Text('Data tidak ditemukan'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Avatar Lingkaran Neumorphic
                NeumorphicContainer(
                  shape: BoxShape.circle,
                  width: 130,
                  height: 130,
                  child: ClipOval(
                    child: Image.network(
                      profile.profilePhoto ?? '',
                      errorBuilder: (_, _, _) => _buildAvatarFallback(profile.name),
                    ),
                  ),
                ),
                Text(profile.name ?? 'Nama Pengguna'),
                Text(profile.email ?? 'Email'),
                // Tombol Edit Nama & Tombol Ubah Foto
                // Kartu Informasi Akun & Pelatihan
              ],
            ),
          );
        },
      ),
    );
  }
}
```

#### C. Penjelasan Logika Antarmuka & Resolusi Foto Profil
1. `_profileFuture` disimpan dalam variabel state dan hanya diisi ulang saat `_refreshProfile()` dipanggil. Hal ini mencegah panggilan jaringan berulang setiap kali layar melakukan render ulang (*rebuild*).
2. **Penyebab Foto Profil Muncul Inisial & Solusinya:**
   - Server mengembalikan `profile_photo` sebagai path relatif (misal: `"profile_photo/tester_123.png"`) dan URL lengkap pada `profile_photo_url` (misal: `"https://appabsensi.mobileprojp.com/public/profile_photo/tester_123.png"`).
   - Agar foto profil selalu tampil dengan benar dan tidak jatuh ke inisial:
     - Jika `isBase64Photo` (dimulai dengan `data:image`), di-render menggunakan `Image.memory(base64Decode(...))`.
     - Jika `displayPhotoUrl` mengembalikan URL lengkap (`profile_photo_url` atau diawali `http`), di-render menggunakan `Image.network(...)`.
     - Jika server hanya mengembalikan path relatif, otomatis diprefiks menjadi `https://appabsensi.mobileprojp.com/public/<path>`.
3. `FutureBuilder` menangani 3 kondisi utama:
   - `ConnectionState.waiting`: Menampilkan indikator loading.
   - `snapshot.hasError`: Menampilkan pesan kesalahan dan tombol "Coba Lagi".
   - `snapshot.hasData`: Merender kartu profil Neumorphic berisi foto, nama, email, status pelatihan, dan tanggal pendaftaran.
4. Tombol **Logout** memicu dialog konfirmasi Neumorphic, menghapus token di `TokenStorage.clearToken()`, dan mengembalikan user ke `LoginView`.

---

### Langkah 11: Membangun Halaman Ubah Nama Profil (`edit_profile_view.dart`)

#### A. Tujuan
Mengizinkan pengguna mengubah informasi nama profil melalui HTTP `PUT /api/profile` dan merefleksikan perubahannya ke dashboard profil.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/views/edit_profile_view.dart`
Alur eksekusi kodenya:
```dart
Future<void> _handleSave() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => _isLoading = true);

  try {
    final response = await _apiService.updateProfile(
      name: _nameController.text.trim(),
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.message ?? 'Profil berhasil diperbarui!')),
    );

    context.pop(true); // Mengembalikan nilai true ke halaman pemanggil
  } catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
    );
  } finally {
    if (mounted) setState(() => _isLoading = false);
  }
}
```

#### C. Penjelasan Logika
- Saat simpan ditekan, request HTTP `PUT` dikirimkan dengan payload `{"name": "..."}`.
- Saat berhasil, `context.pop(true)` dijalankan. Pada `profile_view.dart`, nilai kembalian `true` dideteksi untuk memicu fungsi `_refreshProfile()`, sehingga nama baru langsung terpampang di dashboard tanpa perlu keluar aplikasi.

---

### Langkah 12: Membangun Halaman Ubah Foto Profil Base64 & Upload dari Perangkat (`edit_photo_view.dart`)

#### A. Tujuan
Mengimplementasikan pembaruan foto profil pengguna dengan memilih gambar langsung dari galeri atau kamera perangkat via pustaka `image_picker`, mengonversinya menjadi format Base64, dan mengirimkannya ke endpoint `PUT /api/profile/photo`.

#### B. Pembuatan Berkas `lib/TugasFlutter/tugas16disini/views/edit_photo_view.dart`
Alur penanganan gambar dari galeri, kamera, preset, dan upload Base64:
```dart
class _EditPhotoViewState extends State<EditPhotoView> {
  final ImagePicker _picker = ImagePicker();

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
      });
    } catch (e) {
      // Tampilkan error jika izin ditolak
    }
  }

  Future<void> _handleUpload() async {
    final photoData = _base64Controller.text.trim();
    setState(() => _isLoading = true);

    try {
      final response = await _apiService.updateProfilePhoto(
        profilePhoto: photoData,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message']?.toString() ?? 'Foto berhasil diperbarui!')),
      );

      context.pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
```

#### C. Penjelasan Logika
- **Unggah dari Perangkat (Galeri & Kamera):** Menggunakan `image_picker` dengan dua pilihan tombol Neumorphic: `ImageSource.gallery` dan `ImageSource.camera`. File gambar langsung dibaca byte datanya via `readAsBytes()` dan dikonversi ke Base64 data URI (`data:image/png;base64,...` atau `data:image/jpeg;base64,...`).
- **Pratinjau Gambar Dinamis:** `_buildPreviewImage()` langsung membaca Base64 yang baru dipilih atau diambil kamera dan merendernya secara instan via `Image.memory(...)`.
- **Preset Siap Pakai & Input Kustom:** Pengguna juga tetap dapat memilih preset avatar warna atau menempelkan string Base64 kustom.
- **Kirim ke Server:** Tombol **Perbarui Foto Profil** mengirimkan string Base64 ke `PUT /api/profile/photo` dan memicu refresh otomatis di dashboard saat kembali.

---

### Langkah 13: Menghubungkan ke Titik Masuk Utama (`lib/main.dart`) & Konfigurasi Gradle

#### A. Konfigurasi Titik Masuk `lib/main.dart` (Auto-Login / Session Check)
Buka file `lib/main.dart`. Agar pengguna **tidak perlu login berulang kali saat aplikasi di-refresh (hot restart) atau dibuka kembali**, gunakan `FutureBuilder<String?>` yang memeriksa `TokenStorage.getToken()`. Jika token tersimpan ditemukan, aplikasi langsung membuka `ProfileView()`, dan jika kosong, membuka `LoginView()`:
```dart
import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/services/token_storage.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/login_view.dart';
import 'package:flutterday6/TugasFlutter/tugas16disini/views/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            return const ProfileView();
          }
          return const LoginView();
        },
      ),
    );
  }
}
```

#### B. Konfigurasi Gradle Android (Mengatasi Dependensi `flutter_secure_storage`)
Karena plugin `flutter_secure_storage: ^11.0.0` membutuhkan Android SDK 37, lakukan dua penyesuaian berikut:

1. Pada berkas **`android/app/build.gradle.kts`**, perbarui `compileSdk`:
   ```kotlin
   android {
       namespace = "com.example.flutterday6"
       compileSdk = 37
       ndkVersion = flutter.ndkVersion
       ...
   }
   ```
2. Pada berkas **`android/gradle.properties`**, tambahkan baris berikut untuk menekan peringatan kompatibilitas SDK:
   ```properties
   android.suppressUnsupportedCompileSdk=37.0
   ```

---

### Langkah 14: Pengujian Alur Aplikasi & Verifikasi Kepatuhan Aturan

#### A. Verifikasi Analisis Kode Statis
Jalankan perintah linting Flutter di terminal:
```bash
flutter analyze lib/TugasFlutter/tugas16disini lib/main.dart
```
**Hasil:** `No issues found!` (0 peringatan dan 0 error sintaksis).

#### B. Verifikasi Aturan Bebas Komentar
Seluruh file kode sumber `.dart` pada `lib/TugasFlutter/tugas16disini/` telah diperiksa secara otomatis dan dipastikan murni **tanpa ada baris komentar sama sekali** (0% komentar `//`, `/* */`, atau `///`).

#### C. Pengujian Build Aplikasi Android
Jalankan kompilasi debug untuk memastikan aplikasi dapat berjalan mulus di emulator:
```bash
flutter build apk --debug
```
**Hasil:** `√ Built build\app\outputs\flutter-apk\app-debug.apk` (Kompilasi sukses 100%).

#### D. Uji Alur Pengguna (User Flow):
1. **Layar Login:** Muncul pertama kali dengan form email, password, dan tombol masuk Neumorphic.
2. **Layar Register:** Tautan "Daftar Sekarang" membuka form registrasi dengan dropdown pelatihan dan batch yang terisi otomatis dari server.
3. **Dashboard Profil:** Setelah login, data pengguna tampil via `FutureBuilder` bersama avatar foto dalam bingkai lingkaran Neumorphic.
4. **CRUD Profile:** Menekan "Edit Nama" memperbarui data via `PUT /api/profile`, dan "Ubah Foto" mengunggah gambar via `PUT /api/profile/photo`.
5. **Logout:** Menekan ikon logout menampilkan dialog konfirmasi Neumorphic dan menghapus token lokal.
