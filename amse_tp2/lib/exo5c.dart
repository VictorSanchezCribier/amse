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
  int nombreColones = 2;

  List<Widget> buildTiles(nombre) {
    List<Widget> tuiles = [];
    for (int x = 1; x <= nombre; x++) {
      for (int y = 1; y <= nombre; y++) {
        tuiles.add(Container(
            child: Tile(
                    imageURL: 'https://picsum.photos/512',
                    alignment: Alignment((x-1)*(2)/(nombreColones-1)-1, (y-1)*2/(nombreColones-1)-1))                .croppedImageTile()));
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
            height: MediaQuery.of(context).size.height *
                0.8, // définir une hauteur explicite
            child: GridView.count(
              crossAxisCount: nombreColones,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: buildTiles(nombreColones),
            ),
          ),
          Slider(
            value: nombreColones.toDouble(),
            min: 0,
            max: 10,
            onChanged: (double value) {
              setState(() {
                nombreColones = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
