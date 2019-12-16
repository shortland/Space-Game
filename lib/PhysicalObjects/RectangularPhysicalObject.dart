import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/sprite.dart';

import 'package:spacegame/PhysicalObjects/PhysicalObject.dart';
import 'package:spacegame/SpaceGame.dart';

class RectangularPhysicalObject extends PhysicalObject {
  RectangularPhysicalObject(
      SpaceGameMain game, Size size, Vector2 position, String path)
      : super(game, size, position, path) {
    this.sprite = Sprite(path);

    // Body definition for a rigid body
    BodyDef def = BodyDef();
    def.linearVelocity = Vector2.zero();
    def.position = position;
    def.type = BodyType.STATIC;

    // Create the shape of the object
    this.shape.setAsBoxXY(size.width, size.height);

    // Create the body onto our world
    this.body = game.world.createBody(def);
    body.userData = this;
    body.createFixtureFromShape(shape);

    // Create the rectangle for drawing the sprite onto
    this.dimensions = Rect.fromPoints(Offset(position.x, position.y),
        Offset(position.x + size.width, position.y + size.height));
  }

  @override
  void render(Canvas canvas) {
    sprite?.renderRect(canvas, dimensions);
  }

  @override
  void update(double time) {}

  @override
  void resize(Size size) {}
}
