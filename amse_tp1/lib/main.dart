import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Mediathèque',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
              .copyWith(background: Colors.black),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Mediathèque",
        style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            afficherMenu(context);
          },
        ),
        
      ),
      
    );
  }

 void afficherMenu(BuildContext context) {
    final RenderBox barreNavigation = context.findRenderObject() as RenderBox;
    final position = barreNavigation.localToGlobal(Offset.zero);
    final taille = barreNavigation.size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + 50,  
        position.dx + taille.width,
        position.dy + taille.height,
      ),
      color: Colors.transparent,
      items: [
        
        PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.home), 
            color: Colors.white,
            onPressed: () {  

            },
          )
        ),
         PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.favorite), 
            color: Colors.white,
            onPressed: () {  

            },
          )
        ),
      ],
    );
  }
}


