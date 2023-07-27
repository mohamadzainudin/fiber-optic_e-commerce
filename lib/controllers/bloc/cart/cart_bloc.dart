import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fiber_ecommerce/data/model/product_model.dart';

part 'cart_event.dart';
part 'cart1_state.dart';

List<Product>? prevProduct;

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cartItems: [], cartCounter: 0, itemQty: [])) {
    on<PrevProduct>(
      (event, emit) {
        prevProduct = event.prevProduct;
      },
    );
    on<ItemAddToCart>((event, emit) {
      int existingIndex = state.cartItems
          .indexWhere((product) => product.id == event.cartItems.id);

      if (existingIndex != -1) {
        state.cartItems[existingIndex].attributes.qty++;

        state.cartItems[existingIndex].attributes.price =
            state.cartItems[existingIndex].attributes.qty *
                prevProduct![existingIndex].attributes.price;
      } else {
        state.cartItems.add(event.cartItems);
        emit(CartAdded(
            cartItems: state.cartItems,
            cartCounter: state.cartItems.length,
            itemQty: state.cartItems));
      }

      emit(CartAdded(
          cartItems: state.cartItems,
          cartCounter: state.cartItems.length,
          itemQty: state.cartItems));
    });
    on<ItemRemoveFromCart>(
      (event, emit) {
        int existingIndex = state.cartItems
            .indexWhere((product) => product.id == event.cartItems.id);

        if (state.cartItems[existingIndex].attributes.qty > 1) {
          state.cartItems[existingIndex].attributes.qty--;

          state.cartItems[existingIndex].attributes.price =
              state.cartItems[existingIndex].attributes.qty *
                  prevProduct![existingIndex].attributes.price;
        } else {
          state.cartItems.remove(event.cartItems);
        }
        emit(CartRemove(
            cartItems: state.cartItems,
            cartCounter: state.cartItems.length,
            itemQty: state.cartItems));
      },
    );

    on<ItemDeleteFromCart>(
      (event, emit) {
        state.cartItems.remove(event.cartItems);
        emit(CartDelete(
            cartItems: state.cartItems,
            cartCounter: state.cartItems.length,
            itemQty: state.cartItems));
      },
    );
  }
}
