// part of 'cart_bloc.dart';

// abstract class CartState extends Equatable {
//   final List<Product> cartItems = [];
//   final int cartCounter = 0;

//   int getTotalPrice() {
//     int totalPrice = 0;
//     for (var item in cartItems) {
//       totalPrice += item.attributes.price;
//     }
//     return totalPrice;
//   }

//   int getTotalWeight() {
//     int totalWeight = 0;
//     for (var item in cartItems) {
//       totalWeight += item.attributes.weight;
//     }
//     return totalWeight * 7000;
//   }


// }

// class CartInitial extends CartState {
//   final List<Product> cartItems = [];
//   final int cartCounter = 0;
//   final int cartItemQty = 1;
//   @override
//   List<Object> get props => [];
// }

// class CartAdded extends CartState {
//   List<Product> cartItems = [];
//   int cartCounter = 0;
//   int cartItemQty = 1;

//   CartAdded({required this.cartItems})
//       : cartCounter = cartItems.length != 0 ? cartItems.length : 0;

//   @override
//   // TODO: implement props
//   List<Object?> get props => [cartItems, cartCounter];
// }

// class CartRemove extends CartState {
//   List<Product> cartItems = [];
//   final int cartCounter;
//   // int cartCounter;
//   CartRemove({
//     required this.cartItems,
//   }) : cartCounter = cartItems.length != 0 ? cartItems.length : 0;
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cartItems, cartCounter];
// }

// class CartDelete extends CartState {
//   List<Product> cartItems = [];
//   final int cartCounter;
//   // int cartCounter;
//   CartDelete({
//     required this.cartItems,
//   }) : cartCounter = cartItems.length != 0 ? cartItems.length : 0;
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cartItems, cartCounter];
// }
