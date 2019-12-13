import 'package:flutter/gestures.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Interfaces/UserInterface.dart';

class GestureHandler {
  final SpaceGameMain game;

  GestureHandler(this.game);

  void onTapDown(TapDownDetails d) {
    // bool isHandled = false;

    game.coverage.forEach((k, v) {
      if (k == null) {
        return;
      }

      if (v.contains(d.globalPosition)) {
        // TODO: interface?
        k.onTapDown();
      }
    });
  }
}
