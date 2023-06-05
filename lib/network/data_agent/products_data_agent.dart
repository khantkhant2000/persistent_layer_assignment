import '../../data/vos/products_vo/products_vo.dart';
import '../../data/vos/rating_vo/rating_vo.dart';

abstract class ProductsDataAgent {
  Future<List<ProductsVO>?> getProductsResponse();

  Future<ProductsVO>? getProductDetailResponse(int productId);

  Future<List<RatingVO>?> getRatingResponse();
}
