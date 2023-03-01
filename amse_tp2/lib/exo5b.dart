import 'package:flutter/material.dart';
import 'exo4.dart' as exo4;


class _Tile {
  String imageURL;
  Alignment alignment;

  _Tile({required this.imageURL, required this.alignment});

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


class DisplayGridWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(-1, -1))
            .croppedImageTile()
            ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(0, -1))
            .croppedImageTile()
            ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(1, -1))
            .croppedImageTile()
        ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(-1, 0))
            .croppedImageTile()
        ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(0, 0))
            .croppedImageTile()
            ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(1, 0))
            .croppedImageTile()
            ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(-1, 1))
            .croppedImageTile()
            ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(0, 1))
            .croppedImageTile()
        ),
        Container(
          child: _Tile(
            imageURL: 'https://picsum.photos/512',
            alignment: Alignment(1, 1))
            .croppedImageTile()
        )
      ],
    );
  }
}
