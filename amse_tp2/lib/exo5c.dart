import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;
  

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class DisplayGridWithSlider extends StatefulWidget {
  @override
  State<DisplayGridWithSlider> createState() => _DisplayGridWithSlider();
}

class _DisplayGridWithSlider extends State<DisplayGridWithSlider> {
  int _nombreColones = 3;

  List<Widget> buildTiles(nombre) {
    List<Widget> tuiles = [];
    for (int y = 1; y <= nombre; y++) {
      for (int x = 1; x <= nombre; x++) {
        tuiles.add(Container(
            child: Tile(
                    imageURL: 'https://picsum.photos/512',
                    alignment: Alignment((((x - 1) * (2)) / (nombre - 1)) - 1, (((y - 1) * (2)) / (nombre - 1)) - 1)).croppedImageTile()));
      }
    }
    return tuiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 5c"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *0.8, // définir une hauteur explicite
            child: GridView.count(
              crossAxisCount: _nombreColones,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: buildTiles(_nombreColones),
            ),
          ),
        
          Slider(
            value: _nombreColones.toDouble(),
            min: 3,
            max: 9,
            divisions: 4,
            onChanged: (double value) {
              setState(() {
                _nombreColones = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
