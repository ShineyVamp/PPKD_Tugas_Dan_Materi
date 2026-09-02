// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  price: _toDouble(json['price']),
  description: json['description'] as String?,
  category: $enumDecodeNullable(
    _$CategoryEnumMap,
    json['category'],
    unknownValue: Category.UNKNOWN,
  ),
  image: json['image'] as String?,
  rating: json['rating'] == null
      ? null
      : Rating.fromJson(json['rating'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'category': _$CategoryEnumMap[instance.category],
  'image': instance.image,
  'rating': instance.rating,
};

const _$CategoryEnumMap = {
  Category.ELECTRONICS: 'electronics',
  Category.JEWELERY: 'jewelery',
  Category.MEN_S_CLOTHING: "men's clothing",
  Category.WOMEN_S_CLOTHING: "women's clothing",
  Category.UNKNOWN: 'UNKNOWN',
};

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
  rate: _toDouble(json['rate']),
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
  'rate': instance.rate,
  'count': instance.count,
};
