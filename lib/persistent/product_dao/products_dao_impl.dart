import 'package:fake_store_assgiment/persistent/product_dao/products_dao.dart';
import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/products_vo/products_vo.dart';

class ProductsDAOImpl extends ProductsDAO {
  ProductsDAOImpl._();
  static final ProductsDAOImpl _singleton = ProductsDAOImpl._();
  factory ProductsDAOImpl() => _singleton;

  @override
  void saveForProductsList(List<ProductsVO> productsList) {
    for (ProductsVO productsVO in productsList) {
      _productsBox().put(productsVO.id, productsVO);
    }
  }

  @override
  List<ProductsVO>? getProductsListFromDataBase() =>
      _productsBox().values.toList();

  Box<ProductsVO> _productsBox() => Hive.box<ProductsVO>(kBoxNameForProductsVO);

  @override
  Stream<List<ProductsVO>?> getProductsListFromDataBaseStream() =>
      Stream.value(getProductsListFromDataBase());

  @override
  Stream watchProducts() => _productsBox().watch();
}
