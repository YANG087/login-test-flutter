import 'package:flutter/material.dart';
import 'package:flutter_login/pages/myHome.dart';

class mainDrawer extends StatefulWidget {
  const mainDrawer({ Key? key }) : super(key: key);

  @override
  _mainDrawerState createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('테스트'),
              accountEmail: Text('abc@naver.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/icon_chat.png'),
                backgroundColor: Colors.white,
              ),
              onDetailsPressed: () {
                print('detail 클릭');
              },
              decoration: BoxDecoration(
                color: MyHomePage.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('Home!');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('Setting!');
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('chat'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('click!');
              },
            ),
          ],
        ),
      );
  }
}