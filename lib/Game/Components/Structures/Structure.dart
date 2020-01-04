import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/component.dart';

abstract class Structure extends Component {
  Size size;
  Vector2 position;
  List<dynamic> worldObjects = [];

  Structure(this.size, this.position);
}
