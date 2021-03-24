
import 'package:askproject/layouts/cubit/home_layout_states.dart';
import 'package:askproject/modules/categories/categories_screen.dart';
import 'package:askproject/modules/favourite/favourite_screen.dart';
import 'package:askproject/modules/home/home_screen.dart';
import 'package:askproject/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_layout.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  var userName;
  var avatar;

  var widgets =
  [
    HomeScreen(),
    FavouritesScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];

  var titles = [
    Image(
      image: NetworkImage(
          'https://2code.info/demo/themes/Discy/Boxed/wp-content/themes/discy/images/logo-light-2x.png'),
      height: 40.0,
    ),
    Text(
      'Categories',
      style: TextStyle(color: Colors.black),
    ),
    Text(
      'Favourites',
      style: TextStyle(color: Colors.black),
    ),
    Text(
      'Settings',
      style: TextStyle(color: Colors.black),
    ),
  ];

  var currentIndex = 0;

  changeIndex(index) {
    print(index);

    currentIndex = index;

    print(currentIndex);
    emit(HomeLayoutIndexState());
  }

}