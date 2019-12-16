import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flame/components/component.dart';

import 'package:spacegame/Interfaces/ImageButton.dart';
import 'package:spacegame/Mixins/HasGameRef.dart';
import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';
import 'package:spacegame/Backgrounds/Background.dart';
import 'package:spacegame/Views/ViewTypes.dart';

class IntroView extends SpriteComponent with HasGameRef {
  Rect titleRect;
  Sprite titleSprite;
  ImageButton playBtn;
  Background viewBg;

  IntroView() {
    initialize();
  }

  void initialize() {
    titleSprite = Sprite('interfaces/gametitle.png');
    viewBg = Background(bg: Backgrounds.PLAIN);
    playBtn = ImageButton(
        'interfaces/playbutton.png',
        gameRef.tileSize,
        (gameRef.screenSize.width / 2) - 100.0,
        gameRef.screenSize.height - 250.0,
        200.0,
        50.0);
    playBtn.bindCallback = playClickEvent;

    // Add the new components to the game
    gameRef.background = viewBg;
    gameRef.logger.d('trying to add background for the introview');
    gameRef.add(viewBg);
    gameRef.add(playBtn);
  }

  @override
  void render(Canvas canvas) {
    gameRef.logger.d('rendering for introview');
    super.render(canvas);

    // title sprite and play button
    titleSprite.renderRect(canvas, titleRect);
  }

  @override
  void resize(Size size) {
    // TODO: impl based off of size
    titleRect = Rect.fromLTWH(
      gameRef.tileSize,
      (gameRef.screenSize.height / 2) - (gameRef.tileSize * 4),
      gameRef.tileSize * 7,
      gameRef.tileSize * 4,
    );
  }

  @override
  void update(double time) {
    super.update(time);
    // TODO: some animation things I guess
  }

  void playClickEvent(int a) {
    print("clicked on play");
    gameRef.activeView = ViewTypes.MAIN;

    // NOTE: This works but throws some nasty errors, plus it's generally a bad idea.
    // game.render(tmpCanvas);

    // TODO: This works but isn't great performance wise
    // Create's a whole new instance of the app ontop of the preexisting one
    // runApp(game.widget);
  }
}
