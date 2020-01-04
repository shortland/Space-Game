import 'package:flutter/material.dart';

import 'Game/SpaceGame.dart';
import 'MainPage.dart';

void main() => runApp(new MyApp());

class Game {
  static SpaceGame game = SpaceGame();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Game',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainPage(game: Game.game),
      debugShowCheckedModeBanner: false,
    );
  }
}
