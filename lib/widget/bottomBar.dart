import 'package:flutter/material.dart';
import 'package:flutter_login/pages/myHome.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyHomePage.primaryColor,
      child: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            child: Text('Home'),
          ),
          Tab(
            icon: Icon(Icons.search),
            child: Text('Search'),
          ),
          Tab(
            icon: Icon(Icons.message),
            child: Text('notice'),
          ),
          Tab(
            icon: Icon(Icons.settings),
            child: Text('settings'),
          )
        ],
      ),
    );
  }
}