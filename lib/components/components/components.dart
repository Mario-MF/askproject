import 'package:flutter/material.dart';

Widget drfaultButtom({@required String text,@required function})=>Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: function,
      child: Row(
        children: [
          Icon(Icons.add),
          Text(text,style:TextStyle(color:Colors.white,)),
        ],
      ),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(
              Colors.blue)),
    ));
void NavigatedTo({context,widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void NavigatedAndFinish({context,widget}) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget,), (Route<dynamic>route) => false);