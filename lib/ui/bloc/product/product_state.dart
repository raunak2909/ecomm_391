import 'package:ecomm_391/data/remote/model/product_model.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  List<ProductModel> mProducts;

  ProductLoadedState({required this.mProducts});
}

class ProductErrorState extends ProductState {
  String errorMsg;

  ProductErrorState({required this.errorMsg});
}
