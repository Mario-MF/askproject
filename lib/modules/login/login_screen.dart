import 'package:askproject/components/components/components.dart';
import 'package:askproject/modules/login/cubit/login_cubit.dart';
import 'package:askproject/modules/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  LoginScreen extends  StatelessWidget {
  final formKey=GlobalKey<FormState>();
  var emailCont =TextEditingController();
  var passCont =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, state) {
          if(state is LoginErrorState){
            defaultToast(color: ToastColor.ERROR,text:state.error);
          }else if(state is LoginSuccessState ){
            defaultToast(color: ToastColor.SUCCESS,text:'You Are Login successfully');

          }
        },
        builder: (BuildContext context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultForm(controller: emailCont,hintText: 'Enter Your Email',icon:Icons.person_outline,validator: (value){
                        if(value.isEmpty){
                          return 'please Enter Your User Name';
                        }return null;
                      }),
                      SizedBox(height: 20,),
                      defaultForm(obs: true,controller: passCont,hintText: 'Enter Your Password',icon:Icons.vpn_key_outlined,validator: (value){
                        if(value.isEmpty){
                          return 'please Enter Your Password';
                        }return null;
                      }),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password?',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      drfaultButtonn(text: 'Login',function: (){


                        if(formKey.currentState.validate()){
                          LoginCubit.get(context).getLogin(userName: emailCont.text,password: passCont.text  );

                        }
                      }),
                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont\'t have an account?',style: TextStyle(color: Colors.blueGrey),),
                          Text('Sign Up',style: TextStyle(color: Colors.blue),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              if(state is LoginLoadingState)
              Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
