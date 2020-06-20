import 'package:flutter/material.dart';
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

  set indexVal(int i) {
    _index = i;
    notifyListeners(); 
  }

  int get index {
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

  void moveForwardDay() {
    if (_index >= 6) {
      _index = 0;
    } else {
      _index++;
    }
    notifyListeners();
  }

  void moveBackwardDay() {
    if (_index <= 0) {
      _index = 6;
    } else {
      _index--;
    }
    notifyListeners();
  }

}
