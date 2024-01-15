import 'package:flutter/material.dart';
import 'package:flutter_application_1/datas/announcements_dummy_data.dart';

class StateData extends ChangeNotifier {
  late String pattern = "";
  late String sort = "";
  int unReadAnnouncement =
      announcementsData.where((element) => !(element.isRead)).toList().length;

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
