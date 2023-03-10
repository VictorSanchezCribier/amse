import 'package:flutter/material.dart';
import 'exo1.dart' as exo1;
import 'exo2.dart' as exo2;
import 'exo4.dart' as exo4;
import 'exo5.dart' as exo5;
import 'exo5b.dart' as exo5b;
import 'exo5c.dart' as exo5c;
import 'exo6.dart' as exo6;
import 'exo7.dart' as exo7;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuPage());
  }
}

class Exo {
  final String? title;
  final String? subtitle;
  final WidgetBuilder? buildFunc;

  const Exo({@required this.title, this.subtitle, @required this.buildFunc});
}

List exos = [
  Exo(
      title: 'Exercice 1',
      subtitle: 'Simple image',
      buildFunc: (context) => exo1.DisplayImageWidget()),
  Exo(
      title: 'Exercice 2',
      subtitle: 'Transformed image',
      buildFunc: (context) => exo2.DisplayImageWidget()),
  Exo(
      title: 'Exercice 4',
      subtitle: 'Display Tile',
      buildFunc: (context) => exo4.DisplayTileWidget()),
  Exo(
      title: 'Exercice 5',
      subtitle: 'Display Grid',
      buildFunc: (context) => exo5.DisplayGridWidget()),
  Exo(
      title: 'Exercice 5bis',
      subtitle: 'Display Grid from image',
      buildFunc: (context) => exo5b.DisplayGridWidget()),
  Exo(
      title: 'Exercice 5c',
      subtitle: 'Display Grid from image with slider',
      buildFunc: (context) => exo5c.DisplayGridWithSlider()),
  Exo(
      title: 'Exercice 6',
      subtitle: 'Moove tiles',
      buildFunc: (context) => exo6.PositionedTiles()),
  Exo(
      title: 'Exercice 7',
      subtitle: 'Jeu complet',
      buildFunc: (context) => exo7.PositionedTiles()),
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TP2'),
        ),
        body: ListView.builder(
            itemCount: exos.length,
            itemBuilder: (context, index) {
              var exo = exos[index];
              return Card(
                  child: ListTile(
                      title: Text(exo.title),
                      subtitle: Text(exo.subtitle),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: exo.buildFunc),
                        );
                      }));
            }));
  }
}
