
import 'package:askproject/components/components/components.dart';
import 'package:askproject/components/styles/styles.dart';
import 'package:askproject/layouts/cubit/home_layout_cubit.dart';
import 'package:askproject/layouts/cubit/home_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 18,
              width: double.infinity,
              color: Color(0xffeeeeee),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // NavigatedTo(context: context, widget: LoginPage());
                    },
                    child:Container(
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child: Text(
                                'User',
                                // style: black900,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    iconSize: 50,
                                    icon: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Color(0xffefefef),
                                      child: Icon(
                                        Icons.group,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '5',
                                    style: grey14,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    iconSize: 50,
                                    icon: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Color(0xffefefef),
                                      child: Icon(
                                        Icons.article,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '3',
                                    style: grey14,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    iconSize: 50,
                                    icon: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Color(0xffefefef),
                                      child: Icon(
                                        Icons.notifications,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '87',
                                    style: grey14,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(
              title: 'Edit Profile',
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(
              title: 'About Us',
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 150,
                    child: defaulListTile(
                      title: 'Text Size',
                    ),
                  ),
                  Row(
                    children: [
                      Text('Aa'),
                      Container(
                        height: 30,
                        width: 180,
                        child: FlutterSlider(
                          values: [300],
                          max: 500,
                          min: 200,
                          onDragging: (handlerIndex, lowerValue, upperValue) {},
                        ),
                      ),
                      Text(
                        'Aa',
                        style: black16,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(title: "Rate This App"),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(title: "share the App"),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(
              title: "Privacy policy",
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(
              title: "FAQ",
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            defaulListTile(
              title: "Terms and Conditions",
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 15,
              width: double.infinity,
              color: Color(0xffeeeeee),
            ),
            defaulListTile(
              title: "Contact Us",
              icon: Icons.arrow_forward_ios,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.login_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            Container(
              height: 18,
              width: double.infinity,
              color: Colors.white12,
            ),
          ],
        ),
      ),
    );
  }
}

class defaulListTile extends StatelessWidget {
  const defaulListTile({
    this.title,
    this.icon,
    Key key,
  }) : super(key: key);
  final title;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: black16,
      ),
      trailing: Icon(
        icon,
        size: 17,
        color: Color(0xff080808),
      ),
    );
  }
}

class LogoutListTile extends StatelessWidget {
  const LogoutListTile({
    this.title,
    this.icon,
    Key key,
  }) : super(key: key);
  final title;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
      leading: Icon(
        icon,
        size: 17,
        color: Color(0xff080808),
      ),
    );
  }
}
