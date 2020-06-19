import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DayProvider with ChangeNotifier {
  List _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  int _index = 0;

  int get index{
    return _index;
  }

  List get days {
    return [..._days];
  }

  void checkDay(var result) {
    String formatedDay = DateFormat.EEEE().format(result);
    _index = _days.indexWhere((element) => element.startsWith(formatedDay));
    notifyListeners();
  }

  void getActualDate() {
    String formatedDay = DateFormat.EEEE().format(DateTime.now());
    _index = _days.indexWhere((element) => element.startsWith(formatedDay));
    notifyListeners();
  }
}
