import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/mixins/resizable.dart';

import '../../Mixins/HasGameRef.dart';
import '../Structures/Structure.dart';
import '../WorldObjects/RectangularWorldObject.dart';

class AnimatedRectangleStructure extends Structure with HasGameRef, Resizable {
  AnimatedRectangleStructure(Size size, Vector2 position)
      : super(size, position) {
    this.worldObjects.addAll([
      // ceiling
      RectangularWorldObject(Size(size.width, size.height), position,
          'buildings/someroom_bg_anim.png'),
    ]);
  }

  @override
  void render(Canvas c) {
    for (var obj in worldObjects) {
      obj?.render(c);
    }
  }

  @override
  void update(double dt) {}

  @override
  void resize(Size size) {}
}
