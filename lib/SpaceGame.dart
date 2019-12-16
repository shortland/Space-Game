import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:box2d_flame/box2d.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';

import 'package:spacegame/Gestures/GestureHandler.dart';
import 'package:spacegame/Gestures/Tappable.dart';
import 'package:spacegame/Background.dart';
import 'package:spacegame/Interfaces/UserInterface.dart';
import 'package:spacegame/Structures/HollowRectangleStructure.dart';

class SpaceGameMain extends Game {
  // Box2D
  static const int WORLD_POOL_SIZE = 100;
  static const int WORLD_POOL_CONTAINER_SIZE = 10;

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

  // UI Coverage in Rects - for determining tap event locations
  // The Object - and it's coverage as Rect
  Map<String, Map<Tappable, Rect>> gestureCoverage = {};

  SpaceGameMain() {
    world = World.withPool(
        gravity, DefaultWorldPool(WORLD_POOL_SIZE, WORLD_POOL_CONTAINER_SIZE));

    // Game initialize
    initialize();
  }

  Future initialize() async {
    // resize once initialize dimensions have loaded
    resize(await Flame.util.initialDimensions());

    // Create and draw the background
    background = Background(this);

    // List<String> imageSides = [
    //   'structures/structure_horizontal_rectangle_shell.png',
    //   'structures/structure_vertical_rectangle_shell.png',
    //   'structures/structure_horizontal_rectangle_shell.png',
    //   'structures/structure_vertical_rectangle_shell.png',
    // ];

    box = HollowRectangleStructure(
      this,
      Size(200, 350),
      Vector2(100, 100),
    );

    // rect = RectangularPhysicalObject(this, Size(120, 300), Vector2(100, 100),
    //     'structures/structure_vertical_rectangle_shell.png');

    // Create and draw the user interface
    userInterface = UserInterface(this);

    // Setup tap gesture capabilities
    GestureHandler gestureHandler = GestureHandler(this);
    TapGestureRecognizer tap = TapGestureRecognizer();
    tap.onTapDown = gestureHandler.onTapDown;
    tap.onTapUp = gestureHandler.onTapUp;
    Util().addGestureRecognizer(tap);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    // Resize the UI
    userInterface?.resize();

    // Would be useful to use too
    // screenRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);

    // Resize actual game widget
    super.resize(size);
  }

  // Wall wall;
  @override
  void render(Canvas canvas) {
    if (screenSize == null) {
      return;
    }

    // Save the current canvas state
    canvas.save();

    // Render the background
    background?.render(canvas);

    // Render the user interface
    userInterface?.render(canvas);

    // NOTE: tmp
    box?.render(canvas);

    // Restore the canvas since we're done with it
    canvas.restore();
  }

  @override
  void update(double time) {
    // Physics - maybe want to do something with this eventually?
    // world.stepDt(time, 100, 100);

    // Update the user interface
    userInterface?.update(time);
  }
}
