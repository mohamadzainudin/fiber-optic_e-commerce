import 'package:fiber_ecommerce/controllers/bloc/cart/cart_bloc.dart';
import 'package:fiber_ecommerce/controllers/bloc/get_product/get_product_bloc.dart';
import 'package:fiber_ecommerce/controllers/cubit/category/category_cubit.dart';
import 'package:fiber_ecommerce/data/model/product_model.dart';
import 'package:fiber_ecommerce/data/repository/repositories.dart';
import 'package:fiber_ecommerce/views/product_detail.dart';
import 'package:fiber_ecommerce/widgets/category_button.dart';
import 'package:fiber_ecommerce/widgets/product_gridview.dart';
import 'package:fiber_ecommerce/widgets/searcbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color _selectedBtn = Colors.black;
    final Color _selectedTxt = Colors.white;
    final Color _unselectedBtn = Color.fromARGB(255, 255, 255, 255);
    final Color? _unselectedTxt = Color.fromARGB(255, 169, 169, 169);
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            top: true,
            right: true,
            left: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //searchbar
                  const SizedBox(height: 15),
                  Searchbar(searchController: _searchController),
                  //Banner
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 237, 221, 215),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //Category

                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(children: [
                        CatButton(
                          text: 'All',
                          onTap: () {
                            BlocProvider.of<CategoryCubit>(context)
                                .getCategoryitem(CategoryItem.all);
                          },
                          btnColor:
                              state.index == 0 ? _selectedBtn : _unselectedBtn,
                          txtColor:
                              state.index == 0 ? _selectedTxt : _unselectedTxt,
                        ),
                        CatButton(
                          text: 'Joint Box',
                          onTap: () {
                            BlocProvider.of<CategoryCubit>(context)
                                .getCategoryitem(CategoryItem.jb);
                          },
                          btnColor:
                              state.index == 1 ? _selectedBtn : _unselectedBtn,
                          txtColor:
                              state.index == 1 ? _selectedTxt : _unselectedTxt,
                        ),
                        CatButton(
                          text: 'FDT',
                          onTap: () {
                            BlocProvider.of<CategoryCubit>(context)
                                .getCategoryitem(CategoryItem.fdt);
                          },
                          btnColor:
                              state.index == 2 ? _selectedBtn : _unselectedBtn,
                          txtColor:
                              state.index == 2 ? _selectedTxt : _unselectedTxt,
                        ),
                        CatButton(
                          text: 'FAT',
                          onTap: () {
                            BlocProvider.of<CategoryCubit>(context)
                                .getCategoryitem(CategoryItem.fat);
                          },
                          btnColor:
                              state.index == 3 ? _selectedBtn : _unselectedBtn,
                          txtColor:
                              state.index == 3 ? _selectedTxt : _unselectedTxt,
                        ),
                        CatButton(
                          text: 'Accessories',
                          onTap: () {
                            BlocProvider.of<CategoryCubit>(context)
                                .getCategoryitem(CategoryItem.acc);
                          },
                          btnColor:
                              state.index == 4 ? _selectedBtn : _unselectedBtn,
                          txtColor:
                              state.index == 4 ? _selectedTxt : _unselectedTxt,
                        )
                      ]),
                    ),
                  ),
                  //product_view
                  // Padding(
                  //   padding: const EdgeInsets.all(15),
                  //   child: GridView.builder(
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         crossAxisSpacing: 15,
                  //         childAspectRatio: 2 / 3,
                  //         mainAxisExtent: 250,
                  //       ),
                  //       itemCount: myProducts.length,
                  //       itemBuilder: (BuildContext ctx, index) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => ProductDetail(
                  //                           product: myProducts[index],
                  //                         )));
                  //           },
                  //           child: ProductGrid(
                  //               name: '${myProducts[index]["name"]}',
                  //               price: '${myProducts[index]["price"]}',
                  //               image: '${myProducts[index]["image"]}'),
                  //         );
                  //       }),
                  // ),
                  BlocProvider<GetProductBloc>(
                    create: (context) => GetProductBloc(
                      ProductRepository(),
                    )..add(LoadProductEvent()),
                    child: BlocBuilder<GetProductBloc, GetProductState>(
                      builder: (context, state) {
                        if (state is GetProductLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetProductErrorState) {
                          return Center(
                            child: Text(state.error.toString()),
                          );
                        }
                        if (state is GetProductLoadedState) {
                          // final List<Product> prevProduct;
                          List<Product> productList = state.products;

                          BlocProvider.of<CartBloc>(context)
                              .add(PrevProduct(prevProduct: productList));

                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 2 / 3,
                                  mainAxisExtent: 250,
                                ),
                                itemCount: productList.length,
                                itemBuilder: (BuildContext _, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                    product: productList[index],
                                                  )));
                                    },
                                    child: ProductGrid(
                                        name:
                                            '${productList[index].attributes.name}',
                                        price:
                                            '${productList[index].attributes.price}',
                                        image:
                                            '${productList[index].attributes.image}'),
                                  );
                                }),
                          );
                        }
                        return Container(
                          child: const Center(child: Text('data kosong')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }
}
