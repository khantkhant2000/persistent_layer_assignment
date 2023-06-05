import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constant/api_constant.dart';
import '../../data/vos/products_vo/products_vo.dart';
import '../../data/vos/rating_vo/rating_vo.dart';

part 'products_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class ProductsAPI {
  factory ProductsAPI(Dio dio) => _ProductsAPI(dio);

  @GET(kProductsEndPoint)
  Future<List<ProductsVO>?> getProductsResponse();

  @GET(kProductDetailEndPoint)
  Future<ProductsVO> getProductsDetailResponse(
      @Path(kPathParametersProductsId) int productsId);

  @GET(kProductsEndPoint)
  Future<List<RatingVO>> getRatingResponse();
}
