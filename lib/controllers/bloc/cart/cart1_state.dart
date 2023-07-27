part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final int cartCounter;
  final List<Product> cartItems;
  final List<Product> itemQty;

  CartState({
    required this.cartCounter,
    required this.cartItems,
    required this.itemQty,
  });

  @override
  List<Object?> get props => [cartCounter, cartItems];
}

class CartInitial extends CartState {
  final List<Product> cartItems;
  final int cartCounter;
  final List<Product> itemQty;

  CartInitial({
    required this.cartItems,
    required this.cartCounter,
    required this.itemQty,
  }) : super(cartCounter: 0, cartItems: [], itemQty: []);

  @override
  List<Object?> get props => [cartCounter, cartItems, itemQty];
}

class CartAdded extends CartState {
  final List<Product> cartItems;
  final int cartCounter;
  final List<Product> itemQty;

  CartAdded({
    required this.cartItems,
    required this.cartCounter,
    required this.itemQty,
  }) : super(cartCounter: cartCounter, cartItems: cartItems, itemQty: itemQty);

  @override
  List<Object?> get props => [cartCounter, cartItems, itemQty];
}

class CartRemove extends CartState {
  final List<Product> cartItems;
  final int cartCounter;
  final List<Product> itemQty;
  CartRemove({
    required this.cartItems,
    required this.cartCounter,
    required this.itemQty,
  }) : super(cartCounter: cartCounter, cartItems: cartItems, itemQty: itemQty);

  @override
  List<Object?> get props => [cartCounter, cartItems, itemQty];
}

class CartDelete extends CartState {
  final List<Product> cartItems;
  final int cartCounter;
  final List<Product> itemQty;
  CartDelete({
    required this.cartItems,
    required this.cartCounter,
    required this.itemQty,
  }) : super(cartCounter: cartCounter, cartItems: cartItems, itemQty: itemQty);
  @override
  List<Object?> get props => [cartCounter, cartItems, itemQty];
}
