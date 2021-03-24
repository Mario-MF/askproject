import 'package:askproject/modules/login/cubit/login_states.dart';
import 'package:askproject/network/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super( LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);


  getLogin({userName,password}){
    emit(LoginLoadingState());
    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/user/login/',
      query: {
        'insecure': 'cool',
        'username':userName,
        'password':password,
        'device_token':123,


      },
    ).then((value){
      print(value.data.toString());
      if(value.data['status'] as bool){
        emit(LoginSuccessState());


      }else{
        emit(LoginErrorState(value.data['error'].toString()));
      }
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

}