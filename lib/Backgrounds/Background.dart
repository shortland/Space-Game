import 'dart:ui';

import 'package:flame/sprite.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';

class Background {
  final SpaceGameMain game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game, {Backgrounds bg}) {
    resize();
    bgSprite = Sprite(bgEnumToString(bg) ?? bgEnumToString(Backgrounds.PLAIN));
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void resize() {
    bgRect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
      //game.tileSize * 9,
      //game.tileSize * 23,
    );
  }

  void update(double t) {}
}
