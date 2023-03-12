import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  String imageURL;
  Alignment alignment;
  int nombreColones;

  Tile({
    required this.imageURL,
    required this.alignment,
    required this.nombreColones,
  });

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / nombreColones,
            heightFactor: 1 / nombreColones,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatefulWidget {
  final Tile tile;
  final VoidCallback onPressed;

  TileWidget({
    required this.tile,
    required this.onPressed,
  });

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        child: Center(
          child: Text(
            '',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}








class PositionedTilesState extends State<PositionedTiles> {
  late List<Tile> tiles;
  late int emptyIndex;
  int gridSize = 3;

  @override
  void initState() {
    super.initState();

    tiles = buildTiles(gridSize);
    emptyIndex = 0;
  }

  bool canMove(int tileIndex) {
    // Check if the tile can be moved
    int x = tileIndex % gridSize;
    int y = tileIndex ~/ gridSize;
    int emptyX = emptyIndex % gridSize;
    int emptyY = emptyIndex ~/ gridSize;

    return (x == emptyX && (y - emptyY).abs() == 1) ||
        (y == emptyY && (x - emptyX).abs() == 1);
  }

  void updateGridSize(int value) {
    setState(() {
      gridSize = value;
      tiles = buildTiles(gridSize);
      emptyIndex = 0;
    });
  }

  List<Tile> buildTiles(int nombre) {
    List<Tile> tuiles = [];
    for (int y = 1; y <= nombre; y++) {
      for (int x = 1; x <= nombre; x++) {
        tuiles.add(Tile(
            nombreColones: nombre,
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(
              (((x - 1) * (2)) / (nombre - 1)) - 1,
              (((y - 1) * (2)) / (nombre - 1)) - 1,
            )));
      }
    }
    return tuiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: gridSize,
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
      // Check if puzzle is complete
     /* if (tiles.last.imageURL == null) {
        // Puzzle is complete
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Congratulations!'),
                content: Text('You solved the puzzle!'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Play Again'),
                    onPressed: () {
                      updateGridSize(gridSize);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });*/
      }
    });
  });
}
              )
            )
          )
        ]
      )
    );
  }
}