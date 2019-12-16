import 'dart:ui';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';
import 'package:spacegame/Backgrounds/Background.dart';

class MainView {
  final SpaceGameMain game;
  Background viewBg;

  MainView(this.game) {
    resize();
    viewBg = Background(game, bg: Backgrounds.SPACE);
  }

  void render(Canvas canvas) {
    // render this view bg
    game.background = viewBg;
    game.background?.render(
      canvas,
    );

    // Render the user interface
    game.userInterface?.render(canvas);

    // NOTE: tmp
    game.box?.render(canvas);
  }

  void resize() {
    // Resize the UI
    game.userInterface?.resize();
  }
}
