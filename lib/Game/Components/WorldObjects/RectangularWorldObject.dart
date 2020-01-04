import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';

import '../../Mixins/HasGameRef.dart';
import '../WorldObjects/WorldObject.dart';

class RectangularWorldObject extends WorldObject with HasGameRef, Resizable {
  RectangularWorldObject(Size size, Vector2 position, String path)
      : super(size, position, path) {
    sprite = Sprite(path);

    // Create the rectangle for drawing the sprite onto
    dimensions = Rect.fromPoints(Offset(position.x, position.y),
        Offset(position.x + size.width, position.y + size.height));
  }

  @override
  void render(Canvas c) {
    sprite?.renderRect(c, dimensions);
  }

  @override
  void update(double dt) {}

  @override
  void resize(Size size) {}
}
