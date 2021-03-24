import 'package:askproject/modules/home/cubit/home_states.dart';
import 'package:askproject/network/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates>{
  HomeScreenCubit() : super(HomeStateInitial());
  static HomeScreenCubit get(context)=>BlocProvider.of(context);
  List questions=[];
  getQuestion(){
    emit(HomeStateLoading());
    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/get_recent_posts',
      query: {
        'post_type':'question',
         'count':10
      }).then((value) {
      emit(HomeStateSuccess());
      questions=value.data['posts'];
      print(value.data);
    }).catchError((error){
      emit(HomeStateError(error.toString()));
      print(error);
    });
  }

}