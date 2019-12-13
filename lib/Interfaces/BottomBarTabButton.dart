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

  void render(Canvas c) {
    super.render(c);
  }

  void resize(double left, double top, double width, double height) {
    super.resize(left, top, width, height);
  }

  void moveButton(double left, double top) {
    super.moveButton(left, top);
  }

  void resizeButton(double width, double height) {
    super.resizeButton(width, height);
  }

  void moveButtonTiles(double leftNum, double topNum) {
    super.moveButtonTiles(leftNum, topNum);
  }

  void resizeButtonTiles(double widthNum, double heightNum) {
    super.resizeButtonTiles(widthNum, heightNum);
  }

  void update(double t) {
    super.update(t);
  }
}
