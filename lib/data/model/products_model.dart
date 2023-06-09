import '../vos/products_vo/products_vo.dart';
import '../vos/rating_vo/rating_vo.dart';

abstract class ProductsModel {
  Future<List<ProductsVO>?> getProductsList();

  ProductsVO? getProductDetail(int productId);

  Future<List<RatingVO>?> getRating();

  Stream<List<ProductsVO>?> getProductsListFromDataBase();
}
