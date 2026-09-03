import 'package:json_annotation/json_annotation.dart';

part 'batch_response.g.dart';

@JsonSerializable()
class BatchResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final List<BatchData>? data;

  BatchResponse({
    this.message,
    this.data,
  });

  factory BatchResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchResponseToJson(this);
}

@JsonSerializable()
class BatchData {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'batch_ke')
  final int? batchKe;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  BatchData({
    this.id,
    this.batchKe,
    this.startDate,
    this.endDate,
  });

  factory BatchData.fromJson(Map<String, dynamic> json) =>
      _$BatchDataFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDataToJson(this);
}
