import 'package:flutter/material.dart';
import 'exo4.dart' as exo4;
class DisplayGridWidget extends StatelessWidget {
  exo4.Tile tile = new exo4.Tile(
      imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(
          child: exo4.DisplayTileWidget().createTileWidgetFrom(tile),
        ),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(
          
        ),
        Container(
            ),
        Container(
           ),
        Container(
            )
      ],
    );
  }
}
