import 'dart:ui';

import 'package:spacegame/Mixins/HasGameRef.dart';
import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Backgrounds/Backgrounds.dart';
import 'package:spacegame/Backgrounds/Background.dart';

class MainView with HasGameRef {
  Background viewBg;

  MainView() {
    resize();
    initialize();
  }

  void initialize() {
    viewBg = Background(bg: Backgrounds.SPACE);
  }

  void render(Canvas canvas) {
    // render this view bg
    gameRef.background = viewBg;
    gameRef.background?.render(
      canvas,
    );

    // Render the user interface
    gameRef.userInterface?.render(canvas);

    // NOTE: tmp
    gameRef.box?.render(canvas);
  }

  void resize() {
    // Resize the UI
    gameRef.userInterface?.resize();
  }
}
