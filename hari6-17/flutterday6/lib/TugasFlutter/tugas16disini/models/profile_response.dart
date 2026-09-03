import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final ProfileData? data;

  ProfileResponse({
    this.message,
    this.data,
  });

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

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;

  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;

  @JsonKey(name: 'jenis_kelamin')
  final String? jenisKelamin;

  @JsonKey(name: 'batch_id')
  final int? batchId;

  @JsonKey(name: 'training_id')
  final int? trainingId;

  @JsonKey(name: 'training_title')
  final String? trainingTitle;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.profilePhoto,
    this.profilePhotoUrl,
    this.jenisKelamin,
    this.batchId,
    this.trainingId,
    this.trainingTitle,
  });

  bool get isBase64Photo {
    return profilePhoto != null && profilePhoto!.trim().startsWith('data:image');
  }

  String? get displayPhotoUrl {
    if (profilePhotoUrl != null && profilePhotoUrl!.trim().isNotEmpty) {
      return profilePhotoUrl!.trim();
    }
    if (profilePhoto != null && profilePhoto!.trim().isNotEmpty) {
      final photo = profilePhoto!.trim();
      if (photo.startsWith('http')) {
        return photo;
      }
      if (!photo.startsWith('data:image')) {
        final clean = photo.startsWith('/') ? photo.substring(1) : photo;
        return 'https://appabsensi.mobileprojp.com/public/$clean';
      }
    }
    return null;
  }

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
