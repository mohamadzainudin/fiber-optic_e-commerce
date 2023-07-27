import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'qty_cart_event.dart';
part 'qty_cart_state.dart';

class QtyCartBloc extends Bloc<QtyCartEvent, QtyCartState> {
  QtyCartBloc() : super(QtyCartInitial()) {
    on<QtyCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
