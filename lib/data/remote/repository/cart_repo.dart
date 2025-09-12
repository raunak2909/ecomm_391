import 'package:ecomm_391/data/remote/helper/api_helper.dart';
import 'package:ecomm_391/domain/constants/app_urls.dart';

class CartRepository{
  ApiHelper apiHelper;

  CartRepository({required this.apiHelper});

  Future<dynamic> addToCart({required int productId, required int qty}) async{

    try{
      return await apiHelper.postAPI(url: AppUrls.addToCartUrl, mBody: {
        "product_id":productId,
        "quantity":qty
      });
    } catch(e){
      rethrow;
    }

  }

  ///fetchCart
  fetchCart() async{
    try{
      return await apiHelper.getAPI(url: AppUrls.fetchCartUrl);
    } catch(e){
      rethrow;
    }
  }
}