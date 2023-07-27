part of 'get_product_bloc.dart';

abstract class GetProductEvent extends Equatable {
  const GetProductEvent();
}

class LoadProductEvent extends GetProductEvent {
  @override
  List<Object> get props => [];
}
