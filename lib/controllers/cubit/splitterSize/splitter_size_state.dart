part of 'splitter_size_cubit.dart';

class SplitterSizeState extends Equatable {
  final String selectedSize;
  final int sptPrice;

  const SplitterSizeState(
    this.selectedSize,
    this.sptPrice,
  );

  @override
  List<Object> get props => [selectedSize, sptPrice];
}
