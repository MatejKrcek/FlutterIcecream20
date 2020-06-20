import 'package:flutter/material.dart';

class FlavorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'Flavor1',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'Flavor2',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'Flavor3',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'Flavor4',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
