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
  double tileSize;

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
  void update(double t) {}

  void moveButton(double left, double top) {
    dimensions.translate(left, top);
  }

  void resizeButton(double width, double height) {
    dimensions.shift(Offset(width, height));
  }

  void moveButtonTiles(double leftNum, double topNum) {
    moveButton(leftNum * tileSize, topNum * tileSize);
  }

  void resizeButtonTiles(double widthNum, double heightNum) {
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
