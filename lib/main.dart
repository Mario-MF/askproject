import 'package:askproject/layouts/cubit/home_layout_cubit.dart';
import 'package:askproject/modules/login/login_screen.dart';
import 'package:askproject/network/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>HomeLayoutCubit(), )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}


