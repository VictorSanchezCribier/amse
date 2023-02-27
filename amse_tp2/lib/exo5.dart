import 'package:flutter/material.dart';


class DisplayGridWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3
      children: <Widget>[
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.red
        )
      ],
      );
  }

}