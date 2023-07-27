import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fiber_ecommerce/data/model/product_model.dart';
import 'package:fiber_ecommerce/data/repository/repositories.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  final ProductRepository _productRepository;

  GetProductBloc(this._productRepository) : super(GetProductLoading()) {
    on<LoadProductEvent>((event, emit) async {
      emit(GetProductLoading());
      try {
        final products = await _productRepository.getProducts();
        emit(GetProductLoadedState(products));
      } catch (e) {
        emit(GetProductErrorState(e.toString()));
      }
    });
  }
}
