import 'package:ecomm_391/data/remote/repository/cart_repo.dart';
import 'package:ecomm_391/ui/bloc/cart/cart_event.dart';
import 'package:ecomm_391/ui/bloc/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) async{
      emit(CartLoadingState());

      try {
        dynamic res = await cartRepository.addToCart(productId: event.productId, qty: event.qty);

        if(res["status"] == "true" || res["status"]){
          emit(CartSuccessState());
        } else {
          emit(CartFailureState(errorMsg: res["message"]));
        }

      } catch (e) {
        emit(CartFailureState(errorMsg: e.toString()));
      }
    });
  }
}
