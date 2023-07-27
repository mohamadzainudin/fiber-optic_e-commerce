import 'package:fiber_ecommerce/controllers/bloc/cart/cart_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout',
            style: TextStyle(fontWeight: FontWeight.w300)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Expanded(
              //   child: ListView.builder(
              //       scrollDirection: Axis.vertical,
              //       itemCount: myProducts.length,
              //       itemBuilder: (BuildContext ctx, index) {
              //         return Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(bottom: 8, right: 8),
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     color:
              //                         const Color.fromARGB(255, 144, 144, 144)),
              //                 width: 80,
              //                 height: 80,
              //                 child: Image.asset(
              //                   myProducts[index]['image'],
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //             Align(
              //               alignment: Alignment.centerLeft,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "${myProducts[index]['name']}",
              //                     style: const TextStyle(
              //                         fontSize: 14,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   Text(
              //                     "Size : ${myProducts[index]['id']}",
              //                     style: TextStyle(
              //                         fontSize: 12, color: Colors.grey),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(top: 12),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           'Rp',
              //                           style: TextStyle(
              //                               fontSize: 10, color: Colors.grey),
              //                         ),
              //                         Text(
              //                           "${myProducts[index]['price']}",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Spacer(
              //               flex: 1,
              //             ),
              //             Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                   border: Border.fromBorderSide(
              //                       BorderSide(width: 0.1))),
              //               // padding: EdgeInsets.only(left: 10),
              //               // alignment: Alignment.centerLeft,
              //               height: 30,
              //               width: 70,

              //               // width: ,
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   Container(
              //                     alignment: Alignment.center,
              //                     width: 20,
              //                     padding: const EdgeInsets.all(5),
              //                     child: IconButton(
              //                       padding: const EdgeInsets.all(0),
              //                       iconSize: 15,
              //                       onPressed: () {},
              //                       icon: const Icon(Icons.remove),
              //                       color: Colors.red,
              //                     ),
              //                   ),
              //                   Container(
              //                     alignment: Alignment.center,
              //                     // width: 30,
              //                     padding: const EdgeInsets.all(5),
              //                     child: Text(
              //                       '12',
              //                       style: const TextStyle(
              //                           fontSize: 15,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                   Container(
              //                     alignment: Alignment.center,
              //                     width: 20,
              //                     padding: const EdgeInsets.all(5),
              //                     child: IconButton(
              //                       padding: const EdgeInsets.all(0),
              //                       iconSize: 15,
              //                       onPressed: () {},
              //                       icon: const Icon(Icons.add),
              //                       color: Colors.blue,
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         );
              //       }),
              // ),

              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state.cartItems.isEmpty) {
                    return const Center(
                      child: Text('Tidak Ada Produk'),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.cartItems.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 144, 144, 144)),
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                      state.cartItems[index].attributes.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.cartItems[index].attributes.name,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Weight : ${state.cartItems[index].attributes.weight} Kg",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Rp',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                            ),
                                            // if(state is CartAdded)
                                            // state.cartItems[index].attributes.price *= state.cartItems[index].attributes.qty;
                                            Text(
                                              '${state.cartItems[index].attributes.price}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.fromBorderSide(
                                          BorderSide(width: 0.1))),
                                  // padding: EdgeInsets.only(left: 10),
                                  // alignment: Alignment.centerLeft,
                                  height: 30,
                                  width: 100,

                                  // width: ,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          width: 20,
                                          padding: const EdgeInsets.all(5),
                                          child: IconButton(
                                            padding: const EdgeInsets.only(
                                                right: 60),
                                            iconSize: 20,
                                            onPressed: () {
                                              BlocProvider.of<CartBloc>(context)
                                                  .add(ItemDeleteFromCart(
                                                      cartItems: state
                                                          .cartItems[index]));
                                            },
                                            icon: const Icon(
                                                Icons.delete_forever),
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 20,
                                            padding: const EdgeInsets.all(5),
                                            child: IconButton(
                                              padding: const EdgeInsets.all(0),
                                              iconSize: 15,
                                              onPressed: () {
                                                BlocProvider.of<CartBloc>(
                                                        context)
                                                    .add(ItemRemoveFromCart(
                                                        cartItems: state
                                                            .cartItems[index]));
                                              },
                                              icon: const Icon(Icons.remove),
                                              color: Colors.red,
                                            ),
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              // width: 30,
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                "${state.itemQty[index].attributes.qty}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 20,
                                            padding: const EdgeInsets.all(5),
                                            child: IconButton(
                                              padding: const EdgeInsets.all(0),
                                              iconSize: 15,
                                              onPressed: () {
                                                BlocProvider.of<CartBloc>(
                                                        context)
                                                    .add(ItemAddToCart(
                                                        cartItems: state
                                                            .cartItems[index]));
                                              },
                                              icon: const Icon(Icons.add),
                                              color: Colors.blue,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (cartctx, crtstate) {
          return Container(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtotal',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              const Text(
                                'Rp ',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              Text(
                                // '${crtstate.getTotalPrice()}',
                                'a',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Delivery',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              const Text(
                                'Rp ',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              Text(
                                // '${crtstate.getTotalWeight()}',
                                'a',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              const Text(
                                'Rp ',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              Text(
                                // '${crtstate.getTotalPrice() + crtstate.getTotalWeight()}',
                                'a',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 15,
                  child: ElevatedButton(
                    child: Text(
                      'Checkout',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color?>(Colors.black),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
