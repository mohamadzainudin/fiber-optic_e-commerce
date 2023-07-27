import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavbarItem(NavbarItem navbarItem) {
    if (navbarItem == NavbarItem.home) {
      emit(const NavigationState(NavbarItem.home, 0));
    } else if (navbarItem == NavbarItem.cart) {
      emit(const NavigationState(NavbarItem.cart, 1));
    } else if (navbarItem == NavbarItem.favorite) {
      emit(const NavigationState(NavbarItem.favorite, 2));
    } else if (navbarItem == NavbarItem.profile) {
      emit(const NavigationState(NavbarItem.profile, 3));
    }
  }
}
