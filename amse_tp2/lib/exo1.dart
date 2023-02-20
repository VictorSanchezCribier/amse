import 'package:flutter/material.dart';

class DisplayImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 1"),
      ),
      body: Center(
        child: Image.network("https://picsum.photos/512/1024"),
      ),
    );
  }
}
