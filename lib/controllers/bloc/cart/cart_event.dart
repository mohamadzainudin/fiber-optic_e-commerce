part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class ItemAddToCart extends CartEvent {
  final Product cartItems;

  // final int itemCount;

  const ItemAddToCart({
    required this.cartItems,
  });
}

class ItemRemoveFromCart extends CartEvent {
  final Product cartItems;

  // final int itemCount;
  const ItemRemoveFromCart({
    required this.cartItems,
  });
}

class ItemDeleteFromCart extends CartEvent {
  final Product cartItems;

  // final int itemCount;
  const ItemDeleteFromCart({
    required this.cartItems,
  });
}

class PrevProduct extends CartEvent {
  final List<Product> prevProduct;
  PrevProduct({
    required this.prevProduct,
  });
}
