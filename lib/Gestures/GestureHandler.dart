import 'package:flutter/gestures.dart';
import 'package:spacegame/Mixins/HasGameRef.dart';

import 'package:spacegame/SpaceGame.dart';

class GestureHandler with HasGameRef {
  GestureHandler() {
    gameRef?.gestureCoverage = {
      'tapDown': Map(),
      'tapUp': Map(),
    };
  }

  void onTapDown(TapDownDetails d) {
    gameRef?.gestureCoverage['tapDown']?.forEach((k, v) {
      if (v.contains(d.globalPosition)) {
        k.onTapDown();
        return;
      }
    });
  }

  void onTapUp(TapUpDetails d) {
    gameRef?.gestureCoverage['tapUp']?.forEach((k, v) {
      if (v.contains(d.globalPosition)) {
        k.onTapUp();
        return;
      }
    });
  }
}
