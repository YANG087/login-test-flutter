
import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({ Key? key }) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  var backgroundColor = Colors.white12;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('/images/icon_chat.png'),
            backgroundColor: backgroundColor,
            radius: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
              ),
              Text('프로필명'),
              IconButton(onPressed: () {},
               icon: Icon(Icons.edit),
               focusColor: backgroundColor,
               hoverColor: backgroundColor,
               splashColor: backgroundColor,
               highlightColor: backgroundColor,
              ),
            ],
          ),
          Center(
            child: Text('abc123@gmail.com',
              style: TextStyle(
                fontSize: 11,
              ),),
          ),
        ],
      ),
    );
  }
}