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
  List<Widget> tuiles = [];


  List<Widget> buildTiles(nombre) {
    for (int x = 1; x <= nombre; x++) {
      for (int y = 1; y <= nombre; y++) {
        tuiles.add(Container(
            child: Tile(
                    imageURL: 'https://picsum.photos/512',
                    alignment: Alignment(1, -1))
                .croppedImageTile()));
      }
    }
    return (tuiles);
  }
  @override
  State<DisplayGridWithSlider> createState() => _DisplayGridWithSlider();

}
class _DisplayGridWithSlider extends State<DisplayGridWithSlider>{
    int nombreColones = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 5c"),
      ),
      body: GridView.count(
        crossAxisCount: nombreColones,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),



}
