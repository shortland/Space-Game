import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:spacegame/Interfaces/ImageButton.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';
import 'package:spacegame/Backgrounds/Background.dart';
import 'package:spacegame/Views/ViewTypes.dart';

class IntroView {
  final SpaceGameMain game;
  Rect titleRect;
  Sprite titleSprite;
  ImageButton playBtn;
  Background viewBg;
  Canvas tmpCanvas;

  IntroView(this.game) {
    resize();
    titleSprite = Sprite('interfaces/gametitle.png');
    viewBg = Background(game, bg: Backgrounds.PLAIN);
    initialize();
  }

  void initialize() {
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
    tmpCanvas = canvas;
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
    // tmpCanvas.save(); // maye?
    game.render(tmpCanvas);
    // tmpCanvas.restore();
  }
}
