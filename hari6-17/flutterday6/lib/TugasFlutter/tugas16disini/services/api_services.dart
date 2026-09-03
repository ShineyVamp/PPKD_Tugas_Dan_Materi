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
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
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
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
    }
  }

  Future<ProfileResponse> getProfile({String? token}) async {
    try {
      final options = token != null && token.isNotEmpty
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null;
      final response = await _dio.get(
        '/api/profile',
        options: options,
      );
      return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
    }
  }

  Future<ProfileResponse> updateProfile({
    required String name,
    String? token,
  }) async {
    try {
      final options = token != null && token.isNotEmpty
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null;
      final response = await _dio.put(
        '/api/profile',
        data: {'name': name},
        options: options,
      );
      return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
    }
  }

  Future<Map<String, dynamic>> updateProfilePhoto({
    required String profilePhoto,
    String? token,
  }) async {
    try {
      final options = token != null && token.isNotEmpty
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null;
      final response = await _dio.put(
        '/api/profile/photo',
        data: {'profile_photo': profilePhoto},
        options: options,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
    }
  }

  Future<TrainingResponse> getTrainings() async {
    try {
      final response = await _dio.get('/api/trainings');
      return TrainingResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
    }
  }

  Future<BatchResponse> getBatches() async {
    try {
      final response = await _dio.get('/api/batches');
      return BatchResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      throw Exception(errorMsg);
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
    if (e.type == DioExceptionType.connectionError) {
      return 'Tidak dapat terhubung ke server. Periksa koneksi internet.';
    }
    return e.message ?? 'Terjadi kesalahan pada server';
  }
}
