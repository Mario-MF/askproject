import 'package:askproject/components/components/components.dart';
import 'package:askproject/components/styles/styles.dart';
import 'package:askproject/modules/home/cubit/home_cubit.dart';
import 'package:askproject/modules/home/cubit/home_states.dart';
import 'package:askproject/modules/single_category/single_screen.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit()..getQuestion(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var list = HomeScreenCubit.get(context).questions;
            return ConditionalBuilder(
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) =>
                      buildItem(list[index], context),
                  separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                  itemCount: list.length),
              condition: state is! HomeStateLoading,
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }

  Widget buildItem(question, context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    NavigatedTo(
                        context: context,
                        widget: SingleScreen(
                          title: question["categories"][0]['name'],
                          id: question["categories"][0]['id'],
                        ));
                  },
                  child: Text(
                    '${question["categories"][0]['name']}',
                    style: black16,
                  ),
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
                  'Asked At ${question['date']}',
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
                '${question["title_plain"]}',
                style: black18.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('${question["author"]["avatar"]}'),
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
                            '${question["author"]["name"]}',
                            style: black16.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (question['author']['verified'])
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
                            decoration: BoxDecoration(
                                color: HexColor(
                                    question["author"]["badge"]["color"])),
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
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.grey,
                                  )),
                              onPressed: () {}),
                          Text(question['custom_fields']['question_vote'] !=
                                  null
                              ? question['custom_fields']['question_vote'][0] ??
                                  '0'
                              : '0'),
                          IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: Color(0xffe6e6e6),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  )),
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
              child: Html(
                data: '${question["content"]}',
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    width: 110,
                    height: 40,
                    child: drfaultButton(text: 'Answer', function: () {})),
                Spacer(
                  flex: 1,
                ),
                Icon(Icons.remove_red_eye_outlined),
                SizedBox(
                  width: 5,
                ),
                Text('${question['custom_fields']['post_stats'][0]}'),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.question_answer_outlined),
                SizedBox(
                  width: 5,
                ),
                Text('${question['custom_fields']['comment_count'][0]} Answer'),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.favorite_border_outlined),
              ],
            )
          ],
        ),
      );
}
