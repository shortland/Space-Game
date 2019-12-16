import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:box2d_flame/box2d.dart';
import 'package:flame/flame.dart';
import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:logger/logger.dart';

import 'package:spacegame/Mixins/HasGameRef.dart';
import 'package:spacegame/Gestures/GestureHandler.dart';
import 'package:spacegame/Gestures/Tappable.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';
import 'package:spacegame/Backgrounds/Background.dart';
import 'package:spacegame/Interfaces/UserInterface.dart';
import 'package:spacegame/Structures/HollowRectangleStructure.dart';
import 'package:spacegame/Views/ViewTypes.dart';
import 'package:spacegame/Views/IntroView.dart';
import 'package:spacegame/Views/MainView.dart';
// import 'package:spacegame/Views/HomeZoomableView.dart';
// import 'package:spacegame/Views/MenuView.dart';

class SpaceGameMain extends BaseGame {
  static const int WORLD_POOL_SIZE = 100;
  static const int WORLD_POOL_CONTAINER_SIZE = 10;

  // UI Coverage in Rects - for determining tap event locations
  // The Object - and it's coverage as Rect
  Map<String, Map<Tappable, Rect>> gestureCoverage = {};

  // Logging
  Logger logger = Logger();

  // Views
  ViewTypes activeView = ViewTypes.INTRO;
  ViewTypes lastView;
  IntroView introView;
  MainView mainView;
  // HomeZoomableView homeZoomableView;
  // MenuView menuView;

  World world;
  Vector2 gravity = Vector2.zero();
  Size screenSize;
  num tileSize;
  Background background;
  UserInterface userInterface;

  // NOTE: temporary objects
  HollowRectangleStructure box;

  // Should probably use this eventually
  // final int scale = 5;

  SpaceGameMain() {
    world = World.withPool(
        gravity, DefaultWorldPool(WORLD_POOL_SIZE, WORLD_POOL_CONTAINER_SIZE));

    // Game initialize
    initialize();
  }

  Future initialize() async {
    // resize once initialize dimensions have loaded
    resize(await Flame.util.initialDimensions());

    // Setup tap gesture capabilities
    GestureHandler gestureHandler = GestureHandler();
    TapGestureRecognizer tap = TapGestureRecognizer();
    tap.onTapDown = gestureHandler.onTapDown;
    tap.onTapUp = gestureHandler.onTapUp;
    Util().addGestureRecognizer(tap);

    // init views
    introView = IntroView();
    mainView = MainView();

    logger.d('trying to add intro view');
    add(introView);
    logger.d('done adding intro view');
    // add(mainView);

    // homeZoomableView = HomeZoomableView(this);
    // menuView = MenuView(this);

    // Create and draw the background
    // background = Background(this, bg: Backgrounds.SPACE);

    // box = HollowRectangleStructure(
    //   this,
    //   Size(200, 350),
    //   Vector2(100, 100),
    // );

    // // Create and draw the user interface
    // userInterface = UserInterface(this);
  }

  @override
  void resize(Size size) {
    logger.d('main object resize');
    screenSize = size;
    tileSize = screenSize.width / 9;

    // Resize actual game widget
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // logger.d('rendering for main object');

    // // Render whatever view we currently have active
    // if (activeView == ViewTypes.INTRO && introView != null) {
    //   //
    // } else if (activeView == ViewTypes.MAIN) {
    //   // mainView?.render(canvas);
    // }
  }

  @override
  void update(double time) {
    // Physics - maybe want to do something with this eventually?
    // world.stepDt(time, 100, 100);

    // Update the user interface
    // Do I need this?
    // userInterface?.update(time);
    // super.update(time);
    super.update(time);
  }

  @override
  void preAdd(Component c) {
    if (c is HasGameRef) {
      (c as HasGameRef).gameRef = this;
    }

    super.preAdd(c);
  }
}
