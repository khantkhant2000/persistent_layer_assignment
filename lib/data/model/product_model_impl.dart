import 'package:fake_store_assgiment/data/model/products_model.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../network/data_agent/products_data_agent.dart';
import '../../network/data_agent/products_data_agent_impl.dart';
import '../../persistent/product_dao/products_dao.dart';
import '../../persistent/product_dao/products_dao_impl.dart';
import '../vos/products_vo/products_vo.dart';
import '../vos/rating_vo/rating_vo.dart';

class ProductsModelImpl extends ProductsModel {
  ProductsModelImpl._();

  static final ProductsModelImpl _singleton = ProductsModelImpl._();

  factory ProductsModelImpl() => _singleton;

  final ProductsDataAgent _productsDataAgent = ProductsDataAgentImpl();
  final ProductsDAO _productsDAO = ProductsDAOImpl();

  @override
  Future<ProductsVO>? getProductDetail(int productId) =>
      _productsDataAgent.getProductDetailResponse(productId);

  @override
  Future<List<ProductsVO>?> getProductsList() =>
      _productsDataAgent.getProductsResponse().then((value) {
        if (value != null) {
          _productsDAO.saveForProductsList(value);
        }
        return value;
      });

  @override
  Stream<List<ProductsVO>?> getProductsListFromDataBase() => _productsDAO
      .watchProducts()
      .startWith(_productsDAO.getProductsListFromDataBaseStream())
      .map((event) => _productsDAO.getProductsListFromDataBase());

  @override
  Future<List<RatingVO>?> getRating() => _productsDataAgent.getRatingResponse();

  Future<List<ProductsVO>?> getProducts() =>
      _productsDataAgent.getProductsResponse();
}
