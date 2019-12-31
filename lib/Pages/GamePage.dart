import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/util.dart';

import '../LayoutTypes.dart';
import 'MainAppBar.dart';
import '../Game/SpaceGame.dart';
import '../Game/Gestures/GestureHandler.dart';

class GamePage extends StatelessWidget implements HasLayoutGroup {
  GamePage({Key key, this.layoutGroup, this.onLayoutToggle, this.game})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  final SpaceGame game;

  Widget _buildPageView() {
    return game.widget;
  }

  @override
  Widget build(BuildContext context) {
    // Setup tap gesture capabilities
    GestureHandler gestureHandler = GestureHandler(game);
    TapGestureRecognizer tap = TapGestureRecognizer();
    tap.onTapDown = gestureHandler.onTapDown;
    tap.onTapUp = gestureHandler.onTapUp;
    Util().addGestureRecognizer(tap);

    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.pageView,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildPageView(),
    );
  }
}
