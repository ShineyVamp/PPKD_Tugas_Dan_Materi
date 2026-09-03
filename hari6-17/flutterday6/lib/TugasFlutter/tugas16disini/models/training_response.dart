import 'package:json_annotation/json_annotation.dart';

part 'training_response.g.dart';

@JsonSerializable()
class TrainingResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final List<TrainingData>? data;

  TrainingResponse({
    this.message,
    this.data,
  });

  factory TrainingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingResponseToJson(this);
}

@JsonSerializable()
class TrainingData {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  TrainingData({
    this.id,
    this.title,
  });

  factory TrainingData.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDataToJson(this);
}
