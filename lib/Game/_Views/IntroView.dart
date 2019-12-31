import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../Interfaces/ImageButton.dart';
import '../SpaceGame.dart';
import '../Backgrounds/Backgrounds.dart';
import '../Backgrounds/Background.dart';
import '../Views/ViewTypes.dart';

class IntroView {
  final SpaceGameMain game;
  Rect titleRect;
  Sprite titleSprite;
  ImageButton playBtn;
  Background viewBg;
  // Canvas tmpCanvas;

  IntroView(this.game) {
    resize();
    initialize();
  }

  void initialize() {
    titleSprite = Sprite('interfaces/gametitle.png');
    viewBg = Background(game, bg: Backgrounds.PLAIN);
    playBtn = ImageButton(
        'interfaces/playbutton.png',
        game.tileSize,
        (game.screenSize.width / 2) - 100.0,
        game.screenSize.height - 250.0,
        200.0,
        50.0);
    playBtn.bindCallback = playClickEvent;
  }

  void render(Canvas canvas) {
    // Render this view background
    game.background = viewBg;
    game.background?.render(
      canvas,
    );

    // title sprite and play button
    titleSprite.renderRect(canvas, titleRect);
    playBtn.render(canvas);

    // maybe this works since we aren't really ever writing or changing canvas ever until we use it on the tap/click event binded below
    // tmpCanvas = canvas;
  }

  void resize() {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 4),
      game.tileSize * 7,
      game.tileSize * 4,
    );

    playBtn?.resize((game.screenSize.width / 2) - 100.0,
        game.screenSize.height - 250.0, 200.0, 50.0);

    // register with the gestureCoverage map
    if (playBtn != null) {
      game.gestureCoverage['tapUp']?.update(
          playBtn, (oldV) => playBtn.dimensions,
          ifAbsent: () => playBtn.dimensions);
    }
  }

  void playClickEvent(int a) {
    print("clicked on play");
    game.activeView = ViewTypes.MAIN;

    // NOTE: This works but throws some nasty errors, plus it's generally a bad idea.
    // game.render(tmpCanvas);

    // TODO: This works but isn't great performance wise
    // Create's a whole new instance of the app ontop of the preexisting one
    runApp(game.widget);
  }
}
