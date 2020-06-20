import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tab_screen.dart';
import './providers/day_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DayProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFFFFC61F),
          accentColor: Colors.grey[900],
        ),
        home: TabScreen(),
      ),
    );
  }
}
