import 'dart:ui';

import 'package:box2d_flame/box2d.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Structures/Structure.dart';
import 'package:spacegame/PhysicalObjects/RectangularPhysicalObject.dart';

class HollowRectangleStructure extends Structure {
  double wallWidth = 10;

  HollowRectangleStructure(SpaceGameMain game, Size size, Vector2 position)
      : super(game, size, position) {
    this.physicalObjects.addAll([
      // ceiling
      RectangularPhysicalObject(game, Size(size.width, wallWidth), position,
          'structures/structure_horizontal_rectangle_shell.png'),
      // right side
      RectangularPhysicalObject(
          game,
          Size(wallWidth, size.height),
          Vector2(position.x + (size.width - wallWidth), position.y),
          'structures/structure_vertical_rectangle_shell.png'),
      // floor
      RectangularPhysicalObject(
          game,
          Size(size.width, wallWidth),
          Vector2(position.x, position.y + (size.height - wallWidth)),
          'structures/structure_horizontal_rectangle_shell.png'),
      // left side
      RectangularPhysicalObject(game, Size(wallWidth, size.height), position,
          'structures/structure_vertical_rectangle_shell.png')
    ]);
  }

  @override
  void render(Canvas canvas) {
    for (var obj in physicalObjects) {
      obj.render(canvas);
    }
  }

  @override
  void update(double time) {}

  @override
  void resize(Size size) {}
}
