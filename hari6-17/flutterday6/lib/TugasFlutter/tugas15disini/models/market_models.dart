import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'market_models.g.dart';

List<Market> marketFromJson(String str) =>
    List<Market>.from(json.decode(str).map((x) => Market.fromJson(x)));

String marketToJson(List<Market> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

double? _toDouble(dynamic val) {
  if (val == null) return null;
  if (val is num) return val.toDouble();
  if (val is String) return double.tryParse(val);
  return null;
}

@JsonSerializable()
class Market {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price", fromJson: _toDouble)
  final double? price;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "category", unknownEnumValue: Category.UNKNOWN)
  final Category? category;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "rating")
  final Rating? rating;

  Market({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  Map<String, dynamic> toJson() => _$MarketToJson(this);
}

enum Category {
  @JsonValue("electronics")
  ELECTRONICS("Electronics"),
  @JsonValue("jewelery")
  JEWELERY("Jewelry"),
  @JsonValue("men's clothing")
  MEN_S_CLOTHING("Men's Clothing"),
  @JsonValue("women's clothing")
  WOMEN_S_CLOTHING("Women's Clothing"),
  UNKNOWN("Other");

  final String label;
  const Category(this.label);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: "rate", fromJson: _toDouble)
  final double? rate;

  @JsonKey(name: "count")
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
