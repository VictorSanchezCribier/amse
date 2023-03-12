import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  Color color;

  Tile(this.color);
  Tile.randomColor()
      : color = Color.fromARGB(
            255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}

// ==============
// Widgets
// ==============

class TileWidget extends StatefulWidget {
  final Tile tile;
  final VoidCallback onPressed;

  TileWidget({required this.tile, required this.onPressed});

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          color: widget.tile.color,
          child: Padding(
            padding: EdgeInsets.all(70.0),
          )),
    );
  }
}

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Tile> tiles = List<Tile>.generate(9, (index) => Tile.randomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: tiles.map((tile) {
          return TileWidget(
            tile: tile,
            onPressed: () {
              setState(() {
                int currentIndex = tiles.indexOf(tile);
                int newIndex = (currentIndex + 1) % tiles.length;
                Tile temp = tiles[currentIndex];
                tiles[currentIndex] = tiles[newIndex];
                tiles[newIndex] = temp;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
