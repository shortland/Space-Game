import 'dart:async';

import 'package:flame/util.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacegame/Mixins/HasGameRef.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Views/ViewTypes.dart';

class Main {
  static SpaceGameMain game;
}

void main() async {
  // Wait for flame setup
  await setupFlame();
  Main.game = SpaceGameMain();

  // Start game
  runApp(Main.game.widget);

  // runApp(new MaterialApp(
  //   home: new Scaffold(body: HomeScreen()),
  //   routes: {
  //     '/start': (BuildContext ctx) => Scaffold(body: StartGameScreen()),
  //     '/options': (BuildContext ctx) => Scaffold(body: OptionsScreen()),
  //   },
  // ));
}

class StartGameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartGameView();
}

class MyGameBinder extends SpaceGameMain {
  _StartGameView startView = ViewTypes.INTRO;

  MyGameBinder(defaultView, bool showTutorial) : super(showTutorial);

  @override
  void stop() {
    super.stop();
    this.startView?.redraw();
  }
}

class _StartGameView extends State<StartGameScreen> {
  redraw() {
    this.setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    if (Main.game != null) {
      if (Main.game.state != GameState.STOPPED) {
        return WillPopScope(
          onWillPop: () async {
            return await Main.game.willPop();
          },
          child: Main.game.widget,
        );
      } else {
        Main.game = null;
        setState(() {});
      }
    }

    
  }

  startGame(bool shouldSore, Options options) async {
    bool showTutorial = await Data.getAndToggleShowTutorial();
    Data.currentOptions = options;
    Main.game = new MyGameBinder(this, shouldSore, showTutorial);
    setState(() {});
  }
}

/// Setup all Flame specific parts
Future setupFlame() async {
  WidgetsFlutterBinding.ensureInitialized();

  var flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  await Flame.images.loadAll([
    // backgrounds
    'bgs/space_tall.png',
    'bgs/plain_tall.png',
    // interface items
    'interfaces/interface_bar.png',
    'interfaces/alliance.png',
    'interfaces/cash.png',
    'interfaces/chat.png',
    'interfaces/crystal.png',
    'interfaces/gems.png',
    'interfaces/home.png',
    'interfaces/level.png',
    'interfaces/metal.png',
    'interfaces/shop.png',
    'interfaces/gametitle.png',
    'interfaces/playbutton.png',
    // structures
    'structures/structure_horizontal_rectangle_shell.png',
    'structures/structure_vertical_rectangle_shell.png',
  ]);
}
