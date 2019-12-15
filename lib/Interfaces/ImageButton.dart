import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:flame/sprite.dart';

import 'package:spacegame/Gestures/Tappable.dart';

class ImageButton implements Tappable {
  // UI Sprite
  Sprite image;

  // Physical dimensional item placement objs
  Rect dimensions;

  // The tilesize of the game/screen
  num tileSize;

  Logger logger;

  ImageButton(String filename, this.tileSize, num left, num top, num width,
      num height) {
    // Main bottom bar interface items
    image = Sprite(filename);

    // Create logger
    logger = Logger();

    resize(left, top, width, height);
  }

  void render(Canvas c) {
    image.renderRect(c, dimensions);
  }

  void resize(num left, num top, num width, num height) {
    dimensions = Rect.fromLTWH(
      left,
      top,
      width,
      height,
    );
  }

  // for animated ones?
  void update(double t) {}

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
  }

  @override
  void onTapUp() {
    logger.d("tapUp handling should go here");
  }
}
