import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:flame/sprite.dart';

import '../Gestures/Tappable.dart';

class ImageButton implements Tappable {
  // UI Sprite
  Sprite image;

  // Physical dimensional item placement objs
  Rect dimensions;

  // The tilesize of the game/screen
  num tileSize;

  // Callback for custom function on tap event
  void Function(int) bindCallback;

  Logger logger;

  ImageButton(String filename, this.tileSize, double left, double top,
      double width, double height) {
    // Main bottom bar interface items
    image = Sprite(filename);

    // Create logger
    logger = Logger();

    resize(left, top, width, height);
  }

  void render(Canvas c) {
    image.renderRect(c, dimensions);
  }

  void resize(double left, double top, double width, double height) {
    dimensions = Rect.fromLTWH(
      left,
      top,
      width,
      height,
    );
  }

  // for animated ones?
  void update(double time) {}

  void moveButton(num left, num top) {
    dimensions.translate(left, top);
  }

  void resizeButton(num width, num height) {
    dimensions.shift(Offset(width, height));
  }

  void moveButtonTiles(num leftNum, num topNum) {
    moveButton(leftNum * tileSize, topNum * tileSize);
  }

  void resizeButtonTiles(num widthNum, num heightNum) {
    resizeButton(widthNum * tileSize, heightNum * tileSize);
  }

  @override
  void onTapDown() {
    logger.d("tapDown handling should go here");

    if (bindCallback != null) {
      // tmp int 3, just so i remember how to pass in parameters into callback types
      bindCallback(3);
    }
  }

  @override
  void onTapUp() {
    logger.d("tapUp handling should go here");

    if (bindCallback != null) {
      // tmp int 3, just so i remember how to pass in parameters into callback types
      bindCallback(3);
    }
  }
}
