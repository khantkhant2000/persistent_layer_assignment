import '../../data/vos/products_vo/products_vo.dart';

abstract class ProductsDAO {
  void saveForProductsList(List<ProductsVO> productsList);

  List<ProductsVO>? getProductsListFromDataBase();

  Stream watchProducts();

  Stream<List<ProductsVO>?> getProductsListFromDataBaseStream();
}
