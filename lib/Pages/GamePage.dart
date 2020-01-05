import 'package:flutter/material.dart';

import '../Game/SpaceGame.dart';
import '../Game/TopBar/Widgets.dart';

class GamePage extends StatelessWidget {
  final SpaceGame game;

  GamePage({Key key, this.game}) : super(key: key);

  Widget _buildTopBarWidget(int index, double tileSize, BuildContext context) {
    return TopBarWidgets.build(index, tileSize, context);
  }

  Widget _buildPageView() {
    return game.widget;
  }

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width / 9;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgs/space_tall.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight((tileSize * 0.7) * 2),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      _buildTopBarWidget(0, tileSize, context),
                      _buildTopBarWidget(1, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      _buildTopBarWidget(2, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
        ),
      ],
    );
  }
}
