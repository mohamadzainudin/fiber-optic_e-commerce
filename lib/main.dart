import 'package:fiber_ecommerce/controllers/bloc/cart/cart_bloc.dart';
import 'package:fiber_ecommerce/controllers/bloc/get_product/get_product_bloc.dart';
import 'package:fiber_ecommerce/controllers/cubit/category/category_cubit.dart';
import 'package:fiber_ecommerce/controllers/cubit/cubit/cartcount_cubit.dart';
import 'package:fiber_ecommerce/controllers/cubit/navigation/navigation_cubit.dart';
import 'package:fiber_ecommerce/controllers/cubit/splitterSize/splitter_size_cubit.dart';
import 'package:fiber_ecommerce/data/repository/repositories.dart';
import 'package:fiber_ecommerce/observer/app_bloc_observer.dart';
import 'package:fiber_ecommerce/views/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider<SplitterSizeCubit>(
          create: (context) => SplitterSizeCubit(),
        ),
        BlocProvider<GetProductBloc>(
          create: (context) => GetProductBloc(ProductRepository()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<CartCountCubit>(
          create: (context) => CartCountCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, splashColor: Colors.transparent),
        home: const RootPage(),
      ),
    );
  }
}
