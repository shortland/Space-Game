import 'dart:ui';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Interfaces/ImageButton.dart';

class BottomBarTabButton extends ImageButton {
  final SpaceGameMain game;

  // The button index # placement (as if bottom bar was an array of buttons)
  int barIndex;

  // The button name
  String name;

  // The size of the button
  Size size;

  BottomBarTabButton(
      this.game, this.barIndex, this.name, this.size, String filename)
      : super(filename, game.tileSize, barIndex * size.width,
            game.screenSize.height - size.height, size.width, size.height);

  @override
  void onTapDown() {
    print("processing tap for " + name + "\n");
    super.onTapDown();
  }
}
