import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cartcount_state.dart';

class CartCountCubit extends Cubit<CartCountState> {
  CartCountCubit() : super(CartCountState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
