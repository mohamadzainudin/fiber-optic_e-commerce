import 'package:fiber_ecommerce/controllers/bloc/cart/cart_bloc.dart';
import 'package:fiber_ecommerce/controllers/cubit/navigation/navigation_cubit.dart';
import 'package:fiber_ecommerce/views/cart_page.dart';
import 'package:fiber_ecommerce/views/favorite_page.dart';
import 'package:fiber_ecommerce/views/home_page.dart';
import 'package:fiber_ecommerce/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Color _selectedButton = Colors.black;
  final Color _unselectedButton = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (ctx, cartState) {
        return Scaffold(
            bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              currentIndex: state.index,
              iconSize: 25,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.house,
                      color: state.index == 0
                          ? _selectedButton
                          : _unselectedButton,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -16, end: -16),
                      badgeContent: Text(cartState.cartCounter.toString()),
                      child: Icon(
                        FontAwesomeIcons.basketShopping,
                        color: state.index == 1
                            ? _selectedButton
                            : _unselectedButton,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      size: 32,
                      color: state.index == 2
                          ? _selectedButton
                          : _unselectedButton,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.userLarge,
                        color: state.index == 3
                            ? _selectedButton
                            : _unselectedButton),
                    label: '')
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavbarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavbarItem(NavbarItem.cart);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavbarItem(NavbarItem.favorite);
                } else if (index == 3) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavbarItem(NavbarItem.profile);
                }
              },
            );
          },
        ), body: BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomePage();
          } else if (state.navbarItem == NavbarItem.cart) {
            return const ChartPage();
          } else if (state.navbarItem == NavbarItem.favorite) {
            return const FavoritePage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfilePage();
          }
          return Container();
        }));
      },
    );
  }
}
