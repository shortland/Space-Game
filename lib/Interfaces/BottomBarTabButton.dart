import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:spacegame/Mixins/HasGameRef.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Interfaces/ImageButton.dart';

class BottomBarTabButton extends ImageButton with HasGameRef {
  // The button index # placement (as if bottom bar was an array of buttons)
  int barIndex;

  // The button name
  String name;

  // The size of the button
  Size size;

  BottomBarTabButton(this.barIndex, this.name, this.size, String filename)
      : super(
            filename,
            //gameRef.tileSize
            50,
            barIndex * size.width,
            // gameRef.screenSize.height - size.height,
            400,
            size.width,
            size.height);

  @override
  void onTapUp() {
    // tmp debugd
    gameRef.logger.d("processing tap for " + name);

    // imagebutton tapdown
    super.onTapUp();
  }
}
