part of 'get_product_bloc.dart';

abstract class GetProductState extends Equatable {}

class GetProductLoading extends GetProductState {
  @override
  List<Object> get props => [];
}

class GetProductLoadedState extends GetProductState {
  final List<Product> products;
  GetProductLoadedState(this.products);
  @override
  List<Object> get props => [products];

  @override
  String toString() => 'GetProductLoadedState(products: $products)';
}

class GetProductErrorState extends GetProductState {
  final String error;
  GetProductErrorState(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'GetProductErrorState(error: $error)';
}
