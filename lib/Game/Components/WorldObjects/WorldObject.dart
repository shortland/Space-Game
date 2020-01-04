import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

abstract class WorldObject extends Component {
  Size size;
  Vector2 position;
  String path;

  Sprite sprite;

  Rect dimensions;

  WorldObject(this.size, this.position, this.path);
}
