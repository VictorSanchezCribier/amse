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

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  late List<Tile> tiles;
  late int emptyIndex;
  int gridSize = 3;
  bool won = false;

  @override
  void initState() {
    super.initState();

    tiles = List<Tile>.generate(
        gridSize * gridSize, (index) => Tile.randomColor(index));
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
      tiles = List<Tile>.generate(
          gridSize * gridSize, (index) => Tile.randomColor(index));
      emptyIndex = 0;
    });
  }

  void shuffleTiles() {
    setState(() {
      tiles.shuffle();
      emptyIndex = tiles.indexWhere((tile) => tile.position == 0);
    });
  }

  void checkWon() {
    bool isWon = true;
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].position != i) {
        isWon = false;
        break;
      }
    }

    setState(() {
      won = isWon;
    });
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
                              checkWon();
                            }
                          });
                        },
                      );
              }),
            ),
          ),
          ElevatedButton(
            onPressed: shuffleTiles,
            child: Text('Start'),
          ),
          Slider(
            value: gridSize.toDouble(),
            min: 2,
            max: 6,
            divisions: 4,
            label: gridSize.toString(),
            onChanged: (double value) {
              updateGridSize(value.toInt());
            },
          ),
          SizedBox(height: 20),
          Text(
            won ? 'Gagné!' : '',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
