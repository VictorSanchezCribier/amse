import 'package:flutter/material.dart';
import 'dart:math';

class DisplayImageWidget extends StatefulWidget {
  const DisplayImageWidget({super.key});

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidget();
}

class _DisplayImageWidget extends State<DisplayImageWidget>{
  double _rotateAngleDegreeX = 0.2;
  double _rotateAngleDegreeZ = 0.0;
  bool _mirror = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 2'),
        ),
        body: Center(
          child: Column(children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 400,
              decoration: BoxDecoration(color: Colors.white),
              child: Transform(
                transform:
                    Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                      ..rotateX(pi / 180 * _rotateAngleDegreeX)
                      ..rotateY(_mirror ? pi : 0)
                      ..rotateZ(pi / 180 * _rotateAngleDegreeZ),
                child: Container(
                    child: Image.network('https://picsum.photos/512/1024'),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: Colors.white),
                    height: 400),
              ),
            ),
            Slider(
              value: _rotateAngleDegreeX,
              min: 0,
              max: 360,
              onChanged: (double value) {
                setState(() {
                  _rotateAngleDegreeZ = value;
                });
              },
            ),
             Slider(
              value: _rotateAngleDegreeX,
              min: 0,
              max: 360,
              onChanged: (double value) {
                setState(() {
                  _rotateAngleDegreeX = value;
                });
              },
            ),
          ]),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}