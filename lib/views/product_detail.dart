import 'package:fiber_ecommerce/controllers/bloc/cart/cart_bloc.dart';
import 'package:fiber_ecommerce/controllers/cubit/splitterSize/splitter_size_cubit.dart';
import 'package:fiber_ecommerce/data/model/product_model.dart';
import 'package:fiber_ecommerce/views/cart_page.dart';
import 'package:fiber_ecommerce/views/root_page.dart';
import 'package:fiber_ecommerce/widgets/category_splitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  // final Map<String, dynamic> product;

  final Product product;

  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> fatSplitterSize = [8, 16];
    List<int> fdtSplitterSize = [48, 64];

    Color _selected = Colors.amber;
    Color _unselected = Color.fromARGB(255, 139, 139, 139);

    // List<Map<dynamic, dynamic>> sizes =
    //     List<Map<dynamic, dynamic>>.from(product['size']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details',
            style: TextStyle(fontWeight: FontWeight.w300)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(product['image']),
            // Text(product['name']),
            // Text(product['price'].toString()),

            Container(
              alignment: Alignment.center,
              height: 250,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 144, 144, 144),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.network(
                product.attributes.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              product.attributes.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              product.attributes.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Specification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              product.attributes.productSize,
              style: const TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
            ),
            const SizedBox(height: 5),
            const Text(
              'Splitter Size',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            BlocBuilder<SplitterSizeCubit, SplitterSizeState>(
              builder: (context, state) {
                // return Expanded(
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: product.attributes.productSize == '8' ? 2 : 3 ,
                //       itemBuilder: (BuildContext ctx, index) {
                //         return Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SplitterSize(
                //                 onTap: () {
                //                   BlocProvider.of<SplitterSizeCubit>(context)
                //                       .onSelectedSize(sizes[index]['split']);
                //                 },
                //                 text: '${sizes[index]['split']}',
                //                 btnColor:
                //                     state.selectedSize == sizes[index]['split']
                //                         ? _selected
                //                         : _unselected,
                //                 txtColor: Colors.black,
                //               )
                //             ]);
                //       }),
                // );
                if (product.attributes.productSize == '8') {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fatSplitterSize.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SplitterSize(
                                  onTap: () {
                                    BlocProvider.of<SplitterSizeCubit>(context)
                                        .onSelectedSize(
                                            fatSplitterSize[index].toString());
                                  },
                                  text: fatSplitterSize[index].toString(),
                                  btnColor: state.selectedSize ==
                                          fatSplitterSize[index].toString()
                                      ? _selected
                                      : _unselected,
                                  txtColor: Colors.black,
                                )
                              ]);
                        }),
                  );
                } else if (product.attributes.productSize == '48') {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fdtSplitterSize.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SplitterSize(
                                  onTap: () {
                                    BlocProvider.of<SplitterSizeCubit>(context)
                                        .onSelectedSize(
                                            fdtSplitterSize[index].toString());
                                  },
                                  text: fdtSplitterSize[index].toString(),
                                  btnColor: state.selectedSize ==
                                          fdtSplitterSize[index].toString()
                                      ? _selected
                                      : _unselected,
                                  txtColor: Colors.black,
                                )
                              ]);
                        }),
                  );
                }
                return const Text('-');
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(bottom: 15, top: 15, left: 15, right: 15),
        child: BlocBuilder<SplitterSizeCubit, SplitterSizeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Rp ',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "${(product.attributes.price) + state.sptPrice}",
                      // "${(product['price'] + 150000).toString()}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Add to Cart',
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color?>(
                            Colors.black),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(ItemAddToCart(cartItems: product));
                        final snackBar = SnackBar(
                          content: Text('Produk ditambahkan ke Keranjang !'),
                          // action: SnackBarAction(
                          //     label: 'Lihat Keranjang', onPressed: () {}),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
