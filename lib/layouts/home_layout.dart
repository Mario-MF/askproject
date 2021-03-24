
import 'package:askproject/layouts/cubit/home_layout_cubit.dart';
import 'package:askproject/layouts/cubit/home_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) =>HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state)
        {

        },
        builder: (context, state)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              elevation: 5.0,
              iconTheme: IconThemeData(
                color: Colors.black54,
              ),
            ),
            drawer: Drawer(),
            body: HomeLayoutCubit.get(context).widgets[HomeLayoutCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.grid_on,
                    ),
                    label: 'Categories'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    label: 'Favourites'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: 'Settings'
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index)
              {
                HomeLayoutCubit.get(context).changeIndex(index);
              },
              currentIndex: HomeLayoutCubit.get(context).currentIndex,
            ),
          );
        },
      ),
    );
  }
}