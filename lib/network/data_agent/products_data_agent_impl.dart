import 'package:dio/dio.dart';
import 'package:fake_store_assgiment/network/data_agent/products_data_agent.dart';

import '../../data/vos/products_vo/products_vo.dart';
import '../../data/vos/rating_vo/rating_vo.dart';
import '../api/products_api.dart';

class ProductsDataAgentImpl extends ProductsDataAgent {
  late ProductsAPI _productsAPI;
  ProductsDataAgentImpl._() {
    _productsAPI = ProductsAPI(Dio());
  }

  static final ProductsDataAgentImpl _singleton = ProductsDataAgentImpl._();

  factory ProductsDataAgentImpl() => _singleton;

  @override
  Future<ProductsVO>? getProductDetailResponse(int productId) =>
      _productsAPI.getProductsDetailResponse(productId);

  @override
  Future<List<ProductsVO>?> getProductsResponse() =>
      _productsAPI.getProductsResponse();

  @override
  Future<List<RatingVO>?> getRatingResponse() =>
      _productsAPI.getRatingResponse();
}
