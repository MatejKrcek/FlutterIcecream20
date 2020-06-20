import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './day_screen.dart';
import './edit_screen.dart';
import './profile_screen.dart';
import '../providers/day_provider.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DayScreen(),
    EditScreen(),
    ProfileScreen(),
  ];
  List _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    dateNow();
  }

  void dateNow() async {
    String formatedDay = DateFormat.EEEE().format(DateTime.now());
    int _index = _days.indexWhere((element) => element.startsWith(formatedDay));
    print(_index);
    final data = await Provider.of<DayProvider>(context, listen: false);
    data.indexVal = _index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectDay() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    Provider.of<DayProvider>(context, listen: false).checkDay(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: _selectedIndex == 0
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: _selectDay,
                )
              ]
            : null,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "Voice ",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              TextSpan(
                text: "Icecream",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: _selectedIndex == 0 ? Colors.white : Colors.white70,
            ),
            title: Text(
              'View',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.white : Colors.white70,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit,
                color: _selectedIndex == 1 ? Colors.white : Colors.white70),
            title: Text(
              'Edit',
              style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.white : Colors.white70),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 2 ? Colors.white : Colors.white70),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.white : Colors.white70),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
