import 'dart:ui';

import 'package:box2d_flame/box2d.dart';

import 'package:spacegame/SpaceGame.dart';

abstract class Structure {
  final SpaceGameMain game;
  Size size;
  Vector2 position;
  List<dynamic> physicalObjects = [];

  Structure(this.game, this.size, this.position);

  void render(Canvas canvas);

  void update(double time);

  void resize(Size size);
}
