part of 'category_cubit.dart';

enum CategoryItem { all, jb, fdt, fat, acc }

class CategoryState extends Equatable {
  final CategoryItem categoryItem;
  final int index;
  const CategoryState(
    this.categoryItem,
    this.index,
  );

  @override
  List<Object> get props => [categoryItem, index];
}
