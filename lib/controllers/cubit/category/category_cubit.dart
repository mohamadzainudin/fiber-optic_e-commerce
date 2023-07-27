import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState(CategoryItem.all, 0));

  void getCategoryitem(CategoryItem categoryItem) {
    if (categoryItem == CategoryItem.all) {
      emit(const CategoryState(CategoryItem.all, 0));
    } else if (categoryItem == CategoryItem.jb) {
      emit(const CategoryState(CategoryItem.jb, 1));
    } else if (categoryItem == CategoryItem.fdt) {
      emit(const CategoryState(CategoryItem.fdt, 2));
    } else if (categoryItem == CategoryItem.fat) {
      emit(const CategoryState(CategoryItem.fat, 3));
    } else if (categoryItem == CategoryItem.acc) {
      emit(const CategoryState(CategoryItem.acc, 4));
    }
  }
}
