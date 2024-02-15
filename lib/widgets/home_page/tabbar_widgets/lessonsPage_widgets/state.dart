import 'package:flutter/material.dart';

class StateData extends ChangeNotifier {
  late String pattern = "";
  late String sort = "";
  int unReadAnnouncement = 0;

  void searchData(String newPattern) {
    pattern = newPattern.toLowerCase();
    notifyListeners(); //değiştiğinde haber ver
  }

  void sortData(String newSort) {
    sort = newSort;
    notifyListeners(); //değiştiğinde haber ver
  }

  void countAnnouncement() {
    unReadAnnouncement--;
    notifyListeners();
  }
}
