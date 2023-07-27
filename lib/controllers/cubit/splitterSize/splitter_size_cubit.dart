import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splitter_size_state.dart';

class SplitterSizeCubit extends Cubit<SplitterSizeState> {
  SplitterSizeCubit() : super(const SplitterSizeState('8', 0));

  void onSelectedSize(String size) {
    if (size == '8') {
      emit(SplitterSizeState('8', 0));
    } else if (size == '16') {
      emit(SplitterSizeState('16', 150000));
    } else if (size == '48') {
      emit(SplitterSizeState('48', 0));
    } else if (size == '64') {
      emit(SplitterSizeState('64', 150000));
    }
  }
}
