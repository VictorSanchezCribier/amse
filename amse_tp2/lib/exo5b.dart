import 'package:flutter/material.dart';
import 'exo4.dart' as exo4;
class DisplayGridWidget extends StatelessWidget {
  exo4.Tile Tile = new exo4.Tile(
      imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(
          child: exo4.
        ),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(
          color: Colors.orange,
          child: Center(
            child: Text(
              "Tile 6",
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.none),
            ),
          ),
        ),
        Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                "Tile 7",
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),
              ),
            )),
        Container(
            color: Colors.green,
            child: Center(
              child: Text(
                "Tile 8",
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),
              ),
            )),
        Container(
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                "Tile 9",
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),
              ),
            ))
      ],
    );
  }
}
