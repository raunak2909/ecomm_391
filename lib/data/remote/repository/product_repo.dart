import 'package:ecomm_391/data/remote/helper/api_helper.dart';
import 'package:ecomm_391/domain/constants/app_urls.dart';

class ProductRepository {
  ApiHelper apiHelper;

  ProductRepository({required this.apiHelper});

  Future<dynamic> getProducts(int? catId) async {
    try {
      return await apiHelper.postAPI(
        url: AppUrls.getProductsUrl,
        mBody: catId != null ? {"category_id": catId} : null,
      );
    } catch (e) {
      rethrow;
    }
  }
}
