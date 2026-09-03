// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchResponse _$BatchResponseFromJson(Map<String, dynamic> json) =>
    BatchResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BatchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchResponseToJson(BatchResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

BatchData _$BatchDataFromJson(Map<String, dynamic> json) => BatchData(
  id: (json['id'] as num?)?.toInt(),
  batchKe: (json['batch_ke'] as num?)?.toInt(),
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
);

Map<String, dynamic> _$BatchDataToJson(BatchData instance) => <String, dynamic>{
  'id': instance.id,
  'batch_ke': instance.batchKe,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
};
