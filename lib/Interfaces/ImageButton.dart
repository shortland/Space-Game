import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';

import 'package:spacegame/Mixins/HasGameRef.dart';
import 'package:spacegame/Gestures/Tappable.dart';
import 'package:spacegame/SpaceGame.dart';

class ImageButton extends SpriteComponent with HasGameRef implements Tappable {
  // UI Sprite
  Sprite image;

  // Physical dimensional item placement objs
  Rect dimensions;

  // The tilesize of the game/screen
  num tileSize;

  // Callback for custom function on tap event
  void Function(int) bindCallback;

  // Position of the image... Need to figure out how to make it dynamic via resize()
  // typically would use the game.screenSize to calculate new position, but this class
  // does not have game. Consider adding it?
  double left;
  double top;

  ImageButton(String filename, this.tileSize, this.left, this.top, double width,
      double height) {
    // Main bottom bar interface items
    image = Sprite(filename);

    resize(Size(width, height));

    // register with the gestureCoverage map
    gameRef?.gestureCoverage['tapUp']
        ?.update(this, (oldV) => dimensions, ifAbsent: () => dimensions);
  }

  @override
  void render(Canvas c) {
    image.renderRect(c, dimensions);
  }

  @override
  void resize(Size size) {
    dimensions = Rect.fromLTWH(
      left,
      top,
      size.width,
      size.height,
    );
  }

  @override
  void update(double time) {
    super.update(time);

    // TODO: for animated ones?
  }

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
    gameRef.logger.d("tapDown handling should go here");

    if (bindCallback != null) {
      // tmp int 3, just so i remember how to pass in parameters into callback types
      bindCallback(3);
    }
  }

  @override
  void onTapUp() {
    gameRef.logger.d("tapUp handling should go here");

    if (bindCallback != null) {
      // tmp int 3, just so i remember how to pass in parameters into callback types
      bindCallback(3);
    }
  }
}
