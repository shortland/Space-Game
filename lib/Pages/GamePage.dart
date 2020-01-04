import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flame/util.dart';

import '../LayoutTypes.dart';
import 'MainAppBar.dart';
import '../Game/SpaceGame.dart';
// import '../Game/Gestures/GestureHandler.dart';
// import 'package:zoom_widget/zoom_widget.dart';

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
    double gridWidth = MediaQuery.of(context).size.width / 9;
    // Setup tap gesture capabilities
    // GestureHandler gestureHandler = GestureHandler(game);
    // TapGestureRecognizer tap = TapGestureRecognizer();
    // tap.onTapDown = gestureHandler.onTapDown;
    // tap.onTapUp = gestureHandler.onTapUp;
    // Util().addGestureRecognizer(tap);

    return Scaffold(
      // appBar: MainAppBar(
      //   layoutGroup: layoutGroup,
      //   layoutType: LayoutType.pageView,
      //   onLayoutToggle: onLayoutToggle,
      // ),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(gridWidth * 3),
      //     child: MainAppBar(
      //       layoutGroup: layoutGroup,
      //       layoutType: LayoutType.gameView,
      //       onLayoutToggle: onLayoutToggle,
      //     )),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(gridWidth * 2),
          child: AppBar(
            // automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Row(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconTheme.merge(
                        data: IconThemeData(
                          size: 24.0,
                          color: Color.fromRGBO(255, 10, 255, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      ),
                    ),
                  ]),
                ),
                IconButton(
                  // iconSize: 20.0,
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.account_box),
                  tooltip: 'Profile',
                  onPressed: onLayoutToggle,
                ),
              ],
            ),
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: game.onTapDown,
              child: _buildPageView(),
            ),
          ),
        ],
      ),
    );
  }
}
