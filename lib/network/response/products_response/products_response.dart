import 'package:json_annotation/json_annotation.dart';
import '../../../data/vos/products_vo/products_vo.dart';
import '../../../data/vos/rating_vo/rating_vo.dart';
part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  List<ProductsVO>? productsList;

  ProductsResponse(this.productsList);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}
