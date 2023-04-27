import 'package:flutter/cupertino.dart';

class NavModelProvider extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
