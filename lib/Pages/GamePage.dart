import 'package:flutter/material.dart';

import '../LayoutTypes.dart';
import 'MainAppBar.dart';
import '../Game/SpaceGame.dart';

class GamePage extends StatelessWidget implements HasLayoutGroup {
  GamePage({Key key, this.layoutGroup, this.onLayoutToggle, this.game})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  final SpaceGame game;

  // Widget _buildPage({int index, Color color}) {
  //   return Container(
  //     alignment: AlignmentDirectional.center,
  //     color: color,
  //     child: Text(
  //       '$index',
  //       style: TextStyle(fontSize: 132.0, color: Colors.white),
  //     ),
  //   );
  // }

  Widget _buildPageView() {
    return PageView(
      children: [
        // _buildPage(index: 1, color: Colors.blueGrey),
        game.widget,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.pageView,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildPageView(),
      // body: SpaceGameMain(),
    );
  }
}
