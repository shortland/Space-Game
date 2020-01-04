import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flame/sprite.dart';
import 'package:flame/position.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:wakelock/wakelock.dart';

import 'package:spacegame/Game/Components/Structures/HollowRectangleStructure.dart';
import 'package:spacegame/Game/Components/Buildings/MainBaseBuilding.dart';
import 'Mixins/HasGameRef.dart';
import 'Data/SavedData.dart';
import 'Data/DataObj.dart';
import 'Components/Backgrounds/Backgrounds.dart';
import 'Components/Backgrounds/Background.dart';
import 'Gestures/Tappable.dart';
import 'Data/GridData.dart';
import 'Components/Buildings/GridBuilding.dart';
import 'Components/Structures/AnimatedStructure.dart';

enum GameState { TUTORIAL, PAUSED, RUNNING, AD }

class SpaceGame extends BaseGame {
  GameState state;
  Object rawData;
  DataObj data;

  // don't access _gridData, it's out of date once GridBuilding is created...
  // access through there.
  GridData _gridData;
  GridBuilding gridBuilding;

  // UI Coverage in Rects - for determining tap event locations
  // The Object - and it's coverage as Rect
  Map<String, Map<Tappable, Rect>> gestureCoverage = {};

  // double barHeight;
  Size screenSize;
  double tileSize;

  SpaceGame() {
    _initialize();
  }

  void _initialize() async {
    // await flameUtil.fullScreen();
    await Util().setOrientation(DeviceOrientation.portraitUp);

    // sets the initial size which we need
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
      // buildings
      'buildings/someroom_bg_one.png',
      'buildings/someroom_bg_anim.png',
    ]);

    // load the raw saved data
    rawData = await SavedData.load();

    // set the data property - an obj type which we can access the fields of a save
    data = rawData as DataObj;
    print("the id of this account is: " + data.id);
    print("the optons.someNumber of this account are: " +
        data.options.someNumber.toString());
    print("the _gridData is: " + data.grid.toJson().toString());

    // create the grid from the local saved data
    _gridData = data.grid.clone();

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

    // enable wakelock initially
    print("enabling wakelock");
    Wakelock.enable();

    // add the background
    // add(Background(bg: Backgrounds.SPACE));

    // add the grid
    gridBuilding = GridBuilding(_gridData, screenSize);
    gridBuilding.createGrid();
    for (var struct2 in gridBuilding.roomStructs) {
      // Rect position = Rect.fromLTWH(50, 50, 128, 50);
      print("trying to add real struct" + struct2.toString());
      add(struct2);
    }

    for (var struct in gridBuilding.structs) {
      print("trying to add hollow rectangular structure" + struct.toString());
      add(struct);
    }
  }

  void onTapUp(TapUpDetails d) {
    print("tapped on " + d.localPosition.toString());
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
  Color backgroundColor() => Color.fromRGBO(0, 0, 0, 0.0);

  @override
  void preAdd(Component c) {
    // print("addibg a component c " + c.toString());
    if (c is HasGameRef) {
      // print("component c has game ref!, setting its ref to this.");
      (c as HasGameRef).gameRef = this;
    }

    super.preAdd(c);
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void resize(Size size) {
    print("actual height is: " + size.height.toString());

    if (screenSize != null) {
      if (size.height > screenSize.height) {
        print("ignoring this height resize as it seems to have become larger?");

        super.resize(screenSize);
        return;
      }
    }

    screenSize = Size(size.width, size.height);
    tileSize = screenSize.width / 9.0;

    print("new height is: " + screenSize.height.toString());

    super.resize(screenSize);
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      this.state = GameState.PAUSED;

      print("disabling wakelock");
      Wakelock.disable();
    } else {
      this.state = GameState.RUNNING;

      print("enabling wakelock");
      Wakelock.enable();
    }
  }
}
