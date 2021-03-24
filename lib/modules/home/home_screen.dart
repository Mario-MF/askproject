import 'package:askproject/components/components/components.dart';
import 'package:askproject/components/styles/styles.dart';
import 'package:askproject/modules/home/cubit/home_cubit.dart';
import 'package:askproject/modules/home/cubit/home_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeScreenCubit()..getQuestion(),
      child: BlocConsumer<HomeScreenCubit,HomeScreenStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) =>ConditionalBuilder(
          builder: (BuildContext context)=>ListView.separated(
              itemBuilder: (context,index)=>buildItem(),
              separatorBuilder: (context,index)=>Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.shade200,
              ),
              itemCount: 15),
          condition: state is!  HomeStateLoading,
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        )
      ),
    );
  }

  Widget buildItem() =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Language',
                  style: black16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 10,
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Asked At March 24,2021',
                  style: grey14,
                ),
                Spacer(
                  flex: 1,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xffe6e6e6),
                  child: Icon(
                    Icons.flag_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'dddddddddddddsdsdsdscccccccscscs',
                style: black18,
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mario Maged',
                            style: black16.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Professional',
                                style: black14.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: Color(0xffe6e6e6),
                                  child: Icon(Icons.arrow_drop_up)),
                              onPressed: () {}),
                          Text('15'),
                          IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: Color(0xffe6e6e6),
                                  child: Icon(Icons.arrow_drop_down)),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'dsamlmaskcamsksamfsdkfmslkdcmasasassssssssssssssssssssssssssssdsdkpmskmsj',
                style: black18,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                    width: 110,
                    height: 40,
                    child: drfaultButtom(text: 'Answer', function: () {})),
                Spacer(flex: 1,),
                Icon(Icons.remove_red_eye_outlined),
                SizedBox(width: 5,),
                Text('53'),
                SizedBox(width: 15,),
                Icon(Icons.question_answer_outlined),
                SizedBox(width: 5,),
                Text('5 Answers'),
                SizedBox(width: 15,),
                Icon(Icons.favorite_border_outlined),

              ],
            )
          ],
        ),
      );
}
