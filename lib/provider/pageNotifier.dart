import 'package:flutter/cupertino.dart';
import 'package:flutter_login/pages/authPage.dart';
import 'package:flutter_login/pages/myHome.dart';

class PageNotifier extends ChangeNotifier {
  String _currentPage = MyHomePage.pageName;
  // String _currentPage = AuthPage.pageName;

  String get currentPage => _currentPage;

  void goToMain() {
    _currentPage = MyHomePage.pageName;
    notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
  }

  void goToOhterPage(String name) {
    _currentPage = name;
    notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
  }
}
