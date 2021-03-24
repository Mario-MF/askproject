import 'package:askproject/modules/home/cubit/home_states.dart';
import 'package:askproject/modules/single_category/cubit/single_states.dart';
import 'package:askproject/network/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleScreenCubit extends Cubit<SingleScreenStates>{
  SingleScreenCubit() : super(SingleScreenStateInitial());
  static SingleScreenCubit get(context)=>BlocProvider.of(context);
  List questions=[];
  getSingleCategory(int id){
    emit(SingleScreenStateLoading());
    DioHelper.getData(
        path: 'demo/themes/Discy/Boxed/api/get_category_posts',
        query: {
          'id':id,
          'taxonomy':"question-category"
        }).then((value) {
      emit(SingleScreenStateSuccess());
      questions=value.data['posts'];
      print(value.data);
    }).catchError((error){
      emit(SingleScreenStateError(error.toString()));
      print(error);
    });
  }

}