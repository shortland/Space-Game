import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/sprite.dart';

import 'package:spacegame/SpaceGame.dart';

abstract class PhysicalObject {
  final SpaceGameMain game;

  Size size;
  Vector2 position;
  String path;
  Sprite sprite;

  // start physics
  Vector2 acceleration = Vector2.zero();
  Body body;

  Rect dimensions;
  PolygonShape shape = PolygonShape();

  PhysicalObject(this.game, this.size, this.position, this.path);

  void render(Canvas canvas);

  void update(double time);

  void resize(Size size);
}
