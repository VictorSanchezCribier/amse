import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  Color color = Colors.transparent;

  Tile(this.color);
  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatefulWidget {
  final Tile tile;
  final Function onTap;

  TileWidget(this.tile, {required this.onTap});

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        color: widget.tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ),
      ),
    );
  }
}

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Tile> tiles = List<Tile>.generate(2, (index) => Tile.randomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(
        children: tiles.asMap().entries.map((entry) {
          return TileWidget(
            entry.value,
            onTap: () {
              swapTiles(entry.key);
            },
          );
        }).toList(),
      ),
    );
  }

swapTiles(int key) {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
