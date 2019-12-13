import 'dart:ui';

import 'package:flame/components/component.dart';

class StandardStructure extends SpriteComponent {
  // The name of this structure
  String name;

  // The type of structure it is
  String type;

  // Physics of the structure
  // Body body;
  // PolygonShape shape;

  // Painting/rendering the object
  Path path;
  Paint paint;

  // Constructor
  StandardStructure(this.name, this.type)
      : super.rectangle(100, 200, 'structure_vertical_rectangle');

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    // Size of structure
    this.width = size.width;
    this.height = size.height;

    // Position of structure
    this.x = 0;
    this.y = 0;
  }
}
