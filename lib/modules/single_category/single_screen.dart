import 'package:askproject/components/components/components.dart';
import 'package:askproject/modules/single_category/cubit/single_cubit.dart';
import 'package:askproject/modules/single_category/cubit/single_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleScreen extends StatelessWidget {
  String title;
  int id;

  SingleScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SingleScreenCubit()..getSingleCategory(id),
      child: BlocConsumer<SingleScreenCubit, SingleScreenStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var list = SingleScreenCubit.get(context).questions;
            return Scaffold(
              appBar: AppBar(title: Text(title),),
              body: ConditionalBuilder(
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) =>
                        buildItem(list[index], context),
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                    itemCount: list.length),
                condition: state is! SingleScreenStateLoading,
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            );
          }),
    );
  }
}
