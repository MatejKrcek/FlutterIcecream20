import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/day_provider.dart';
import '../widgets/flavor_list.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        data.moveBackwardDay();
                      },
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  'Flavors on ${data.days[data.index]}',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        data.moveForwardDay();
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlavorList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
