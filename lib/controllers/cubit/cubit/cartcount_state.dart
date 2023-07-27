part of 'cartcount_cubit.dart';

enum CounterStatus { initial, loading, success, failure }

class CartCountState {
  const CartCountState({
    required this.counterStatus,
    required this.counter,
    required this.error,
  });

  factory CartCountState.initial() => const CartCountState(
        counterStatus: CounterStatus.initial,
        counter: 0,
        error: '',
      );

  final CounterStatus counterStatus;
  final int counter;
  final String error;

  // @override
  // List<Object> get props => [counterStatus, counter, error];

  @override
  bool? get stringify => true;

  CartCountState copyWith({
    CounterStatus? counterStatus,
    int? counter,
    String? error,
  }) {
    return CartCountState(
      counterStatus: counterStatus ?? this.counterStatus,
      counter: counter ?? this.counter,
      error: error ?? this.error,
    );
  }
}
