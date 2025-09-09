import 'package:ecomm_391/data/remote/model/product_model.dart';
import 'package:ecomm_391/data/remote/repository/product_repo.dart';
import 'package:ecomm_391/ui/bloc/product/product_event.dart';
import 'package:ecomm_391/ui/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;

  ProductBloc({required this.productRepository})
    : super(ProductInitialState()) {

    on<GetProductsEvent>((event, emit) async{
      emit(ProductLoadingState());

      try {

        dynamic res = await productRepository.getProducts(event.catId);

        if(res["status"]){
          ProductDataModel mData = ProductDataModel.fromJson(res);
          emit(ProductLoadedState(mProducts: mData.data ?? []));
        } else {
          emit(ProductErrorState(errorMsg: res["message"]));
        }


      } catch (e) {
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}
