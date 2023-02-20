import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _value = 20;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
      children:[ 
        Center(
          child:
          Container(

          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white),
          height: 400,
          child: Image.network("https://picsum.photos/512/1024"),
        ),
        ),
        Center(
        child: Container(
          width: 500,
          child: Row(
            children: [
              Text("Rotate X : "),
              Slider(
                min: 0.0,
                max: 100.0,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              )

          ],
          ) 
        ),
        ),
      ],
      )  
    );
  }
}
