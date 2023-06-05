import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../rating_vo/rating_vo.dart';

part 'products_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kProductTypeId1)
class ProductsVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;

  @JsonKey(name: 'price')
  @HiveField(2)
  double? price;

  @JsonKey(name: 'description')
  @HiveField(3)
  String? description;

  @JsonKey(name: 'category')
  @HiveField(4)
  String? category;

  @JsonKey(name: 'image')
  @HiveField(5)
  String? image;

  @JsonKey(name: 'rating')
  @HiveField(6)
  RatingVO? rating;

  ProductsVO(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductsVO.fromJson(Map<String, dynamic> json) =>
      _$ProductsVOFromJson(json);
}
