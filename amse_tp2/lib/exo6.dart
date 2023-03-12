import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  Color color;
  int position;

  Tile(this.color, this.position);
  Tile.randomColor(int position)
      : color = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
        position = position;
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
        child: Center(
          child: Text(
            '${widget.tile.position}',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
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
  late List<Tile> tiles;
  late int emptyIndex;

  @override
  void initState() {
    super.initState();

    tiles = List<Tile>.generate(
        9, (index) => Tile.randomColor(index));
    emptyIndex = 0;
  }

  bool canMove(int tileIndex) {
    // Check if the tile can be moved
    int x = tileIndex % 3;
    int y = tileIndex ~/ 3;
    int emptyX = emptyIndex % 3;
    int emptyY = emptyIndex ~/ 3;

    return (x == emptyX && (y - emptyY).abs() == 1) ||
        (y == emptyY && (x - emptyX).abs() == 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(tiles.length, (index) {
          return index == emptyIndex
              ? Container(color: Colors.transparent)
              : TileWidget(
                  tile: tiles[index],
                  onPressed: () {
                    setState(() {
                      if (canMove(index)) {
                        // Swap tiles
                        Tile temp = tiles[index];
                        tiles[index] = tiles[emptyIndex];
                        tiles[emptyIndex] = temp;
                        emptyIndex = index;
                      }
                    });
                  },
                );
        }),
      ),
    );
  }
}

