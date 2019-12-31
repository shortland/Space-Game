import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';

import '../../Mixins/HasGameRef.dart';
import 'Backgrounds.dart';

class Background extends Component with HasGameRef, Resizable {
  Sprite bgSprite;
  Rect bgRect;

  Background({Backgrounds bg}) {
    bgSprite = Sprite(bgEnumToString(bg) ?? bgEnumToString(Backgrounds.PLAIN));
  }

  @override
  void resize(Size size) {
    bgRect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
  }

  @override
  void render(Canvas c) {
    if (!bgSprite.loaded()) {
      return;
    }

    bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double dt) {}
}
