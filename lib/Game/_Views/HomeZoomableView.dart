import 'dart:ui';

import 'package:flame/sprite.dart';

import '../SpaceGame.dart';

class HomeZoomableView {
  final SpaceGameMain game;
  Rect titleRect;
  Sprite titleSprite;

  HomeZoomableView(this.game) {
    resize();
    titleSprite = Sprite('interfaces/gametitle.png');
  }

  void render(Canvas canvas) {
    titleSprite.renderRect(canvas, titleRect);
  }

  void resize() {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 4),
      game.tileSize * 7,
      game.tileSize * 4,
    );
  }
}
