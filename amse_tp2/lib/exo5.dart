import 'package:flutter/material.dart';


class DisplayGridWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(
          color: Colors.pink,
          child: Center(
            child: Text(
              "Tile 1",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
              ),
          )
        ),
        Container(
          color: Colors.red,
          child: Center(
            child: Text(
              "Tile 2",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
              ),
          )
        ),
        Container(
          color: Colors.purple,
          child: Center(
            child: Text(
              "Tile 3",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
              ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              "Tile 4",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
              ),
          )
        ),
        Container(
          color: Colors.blueGrey,
          child: Center(
            child: Center(
              child: Text(
                "Tile 5",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
                ),
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Center(
            child: Text(
              "Tile 6",
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
            child: Text(
              "Tile 7",
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),),
          )
        ),
        Container(
          color: Colors.green,
          child: Center(
            child: Text(
              "Tile 8",
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),),
          )
        ),
        Container(
          color: Colors.lightGreenAccent,

          child: Center(
            child: Text(
              "Tile 9",
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
              ),
          )
        )
      ],
      );
  }

}