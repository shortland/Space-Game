import 'dart:ui';

import 'package:logger/logger.dart';

import '../SpaceGame.dart';
import '../Interfaces/ImageButton.dart';

class BottomBarTabButton extends ImageButton {
  final SpaceGameMain game;

  // The button index # placement (as if bottom bar was an array of buttons)
  int barIndex;

  // The button name
  String name;

  // The size of the button
  Size size;

  Logger logger;

  BottomBarTabButton(
      this.game, this.barIndex, this.name, this.size, String filename)
      : super(filename, game.tileSize, barIndex * size.width,
            game.screenSize.height - size.height, size.width, size.height) {
    logger = Logger();
  }

  @override
  void onTapUp() {
    // tmp debugd
    logger.d("processing tap for " + name);

    // imagebutton tapdown
    super.onTapUp();
  }
}
