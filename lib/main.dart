import 'package:flutter/material.dart';
import 'package:flutter_login/pages/authPage.dart';
import 'package:flutter_login/pages/myHome.dart';
import 'package:flutter_login/provider/pageNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<PageNotifier>(
          builder: (BuildContext context, pageNotifier, Widget? child) {
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: '크톡')),
                if (pageNotifier.currentPage == AuthPage.pageName) AuthPage(),
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}
