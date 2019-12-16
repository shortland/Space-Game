import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/sprite.dart';

import 'package:spacegame/SpaceGame.dart';

class ImageStructureRectangular {
  final SpaceGameMain game;

  // width of the wall
  num wallWidth = 10;

  // the width and height
  num width;
  num height;

  // the top left position
  num x;
  num y;

  // Image paths of the structure
  List<String> imagePaths = [];

  // Generated sprites of the structure
  List<Sprite> structureSprites = [];

  // Rect dimensions of each side
  List<Rect> structureDimensions = [];

  Body body;
  PolygonShape shape = PolygonShape();

  // Path path = Path();
  // Paint paint = Paint();

  // Constructor
  ImageStructureRectangular(
    this.game,
    this.width,
    this.height,
    this.imagePaths,
  ) {
    // shape.setAsBox(100.0, 100.0, Vector2(100, 100), 0.0);
    // print(imagePaths[0]);
    // path.addPolygon(
    //     shape.vertices.map((vector) => Offset(vector.x, vector.y)).toList(),
    //     true);
    // paint.color = Color.fromRGBO(100, 200, 100, 1.0);

    // Create the sprites
    for (var path in imagePaths) {
      structureSprites.add(Sprite(path));
    }

    structureDimensions.addAll([
      // top side
      Rect.fromPoints(
          Offset(0.0, 0.0), Offset(width.toDouble(), wallWidth.toDouble())),
      // right side
      Rect.fromPoints(Offset(width.toDouble(), 0.0),
          Offset(width.toDouble() - wallWidth.toDouble(), height.toDouble())),
      // bottom side
      Rect.fromPoints(Offset(0.0, height.toDouble()),
          Offset(width.toDouble(), height.toDouble() - wallWidth.toDouble())),
      // left side
      Rect.fromPoints(
          Offset(0.0, 0.0), Offset(wallWidth.toDouble(), height.toDouble())),
    ]);
  }

  void render(Canvas canvas) {
    int i = 0;
    for (var sprite in structureSprites) {
      sprite.renderRect(canvas, structureDimensions.elementAt(i));
      i++;
    }
  }

  void update(double t) {}

  void resize(Size size) {
    // this.width = size.width;
    // this.height = size.height;

    // redo structureDimensions
  }
}
