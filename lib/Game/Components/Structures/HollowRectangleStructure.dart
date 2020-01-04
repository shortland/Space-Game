import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/mixins/resizable.dart';

import '../../Mixins/HasGameRef.dart';
import '../Structures/Structure.dart';
import '../WorldObjects/RectangularWorldObject.dart';

class HollowRectangleStructure extends Structure with HasGameRef, Resizable {
  double _wallWidth;

  /// Position is the top left corner of the object,
  /// its rendered given that starting point.
  HollowRectangleStructure(Size size, Vector2 position, {double wallWidth})
      : super(size, position) {
    _wallWidth = wallWidth ?? 10;

    this.worldObjects.addAll([
      // ceiling
      RectangularWorldObject(Size(size.width, _wallWidth), position,
          'structures/structure_horizontal_rectangle_shell.png'),
      // right side
      RectangularWorldObject(
          Size(_wallWidth, size.height),
          Vector2(position.x + (size.width - _wallWidth), position.y),
          'structures/structure_vertical_rectangle_shell.png'),
      // floor
      RectangularWorldObject(
          Size(size.width, _wallWidth),
          Vector2(position.x, position.y + (size.height - _wallWidth)),
          'structures/structure_horizontal_rectangle_shell.png'),
      // left side
      RectangularWorldObject(Size(_wallWidth, size.height), position,
          'structures/structure_vertical_rectangle_shell.png')
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
