import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flame/position.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import 'Mixins/HasGameRef.dart';
import 'Data/SavedData.dart';
import 'Data/DataObj.dart';
import 'Components/Backgrounds/Backgrounds.dart';
import 'Components/Backgrounds/Background.dart';
import 'Gestures/Tappable.dart';

enum GameState { TUTORIAL, PAUSED, RUNNING, AD }

class SpaceGame extends BaseGame {
  GameState state;
  Object rawData;
  DataObj data;

  // UI Coverage in Rects - for determining tap event locations
  // The Object - and it's coverage as Rect
  Map<String, Map<Tappable, Rect>> gestureCoverage = {};

  Size screenSize;
  double tileSize;

  SpaceGame() {
    _initialize();
  }

  void _initialize() async {
    // await flameUtil.fullScreen();
    await Util().setOrientation(DeviceOrientation.portraitUp);
    resize(await Flame.util.initialDimensions());

    // load images
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

    // load the raw saved data
    rawData = await SavedData.load();

    // set the data property - an obj type which we can access the fields of a save
    data = rawData as DataObj;
    print("the id of this account is: " + data.id);
    print("the optons number of this account are: " +
        data.options.someNumber.toString());

    // // Setup tap gesture capabilities
    // GestureHandler gestureHandler = GestureHandler(this);
    // TapGestureRecognizer tap = TapGestureRecognizer();
    // tap.onTapDown = gestureHandler.onTapDown;
    // tap.onTapUp = gestureHandler.onTapUp;
    // Util().addGestureRecognizer(tap);

    // data etc is done loading, now startup the game
    _startup(showTutorial: data.showTutorial, state: GameState.RUNNING);
  }

  void _startup({showTutorial: bool, state: GameState}) {
    print("startup sequence begin");
    this.state = state;

    add(Background(bg: Backgrounds.SPACE));
  }

  bool handlingClick() {
    return state == GameState.RUNNING || state == GameState.TUTORIAL;
  }

  void startInput(Position p, int dt) {
    if (state == GameState.TUTORIAL || state == GameState.PAUSED) {
      return;
    }

    if (p != null) {
      // reset some things we might need
    }
  }

  @override
  bool debugMode() => true;

  @override
  void preAdd(Component c) {
    print("addibg a component c " + c.toString());
    if (c is HasGameRef) {
      print("component c has game ref!, setting its ref to this.");
      (c as HasGameRef).gameRef = this;
    }

    super.preAdd(c);
  }

  @override
  void render(Canvas c) {
    // print("render called");
    super.render(c);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    super.resize(size);
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      this.state = GameState.PAUSED;
      Wakelock.disable();
    } else {
      this.state = GameState.RUNNING;
      Wakelock.enable();
    }
  }
}
