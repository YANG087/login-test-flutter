import 'package:flutter/material.dart';
import 'package:flutter_login/model/messageModel.dart';
import 'package:flutter_login/pages/MyInfo.dart';
import 'package:flutter_login/pages/authPage.dart';
import 'package:flutter_login/pages/chatListPage.dart';
import 'package:flutter_login/provider/pageNotifier.dart';
import 'package:flutter_login/widget/bottomBar.dart';
import 'package:flutter_login/widget/mainDrawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static final String pageName = 'MyHomePage';
  static final Color? primaryColor = Colors.deepPurple[100];
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Message> message = [
    Message('내용1','친구1','reciver','2021.07.30','Y'),
    Message('내용2','이웃','reciver','2021.07.29','N'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: MyHomePage.primaryColor,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search');
              }
             ),
             IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Provider.of<PageNotifier>(context, listen: false)
                    .goToOhterPage(AuthPage.pageName);
              }
             ),
          ],
        ),
        drawer: mainDrawer(),
        body: TabBarView(
          children:[
            MyInfo(),
            ChatListPage(messageList: message),
            Container(
              child: Center(
                child: Text('serach')
              ),
            ),
            Container(
              child: Center(
                child: Text('notice')
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
