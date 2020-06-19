import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/day_provider.dart';

class DayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DayProvider>(
      builder: (ctx, data, _) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Flavors on ${data.days[data.index]}:',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
