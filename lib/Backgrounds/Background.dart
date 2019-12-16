import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'package:spacegame/Mixins/HasGameRef.dart';
import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';

class Background extends SpriteComponent with HasGameRef {
  Sprite bgSprite;
  Rect bgRect;

  Background({Backgrounds bg}) {
    bgSprite = Sprite(bgEnumToString(bg) ?? bgEnumToString(Backgrounds.PLAIN));
    gameRef.logger.d('created bgsprite object');
  }

  @override
  void render(Canvas canvas) {
    gameRef.logger.d('rendering background');
    bgSprite.renderRect(canvas, bgRect);
    gameRef.logger.d('finished rendering background');
  }

  @override
  void resize(Size size) {
    // TODO: use size
    bgRect = Rect.fromLTWH(
      0,
      0,
      gameRef.screenSize.width,
      gameRef.screenSize.height,
      //game.tileSize * 9,
      //game.tileSize * 23,
    );
  }

  @override
  void update(double time) {
    super.update(time);
    // TODO: do something with bg on update?
  }
}
