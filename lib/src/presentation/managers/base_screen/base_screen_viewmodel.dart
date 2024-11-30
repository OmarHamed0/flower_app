import 'package:flower_app/src/presentation/pages/cart/cart_screen.dart';
import 'package:flower_app/src/presentation/pages/categories/categories_screen.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'base_screen_state.dart';

@injectable
class BaseScreenViewmodel extends Cubit<BaseHomeState> {
  BaseScreenViewmodel() : super(HomeInitial());

  int _currentIndex = 0;

  // Expose current index
  int get currentIndex => _currentIndex;

  final List<String> _titles = [
    'Home',
    'Categories',
    'Cart',
    'Profile',
  ];

  final List<Widget> _screens = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  String get currentTitle => _titles[_currentIndex];
  Widget get currentScreen => _screens[_currentIndex];

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeStateUpdated());
  }
}
