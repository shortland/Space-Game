import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flame/util.dart';

import '../LayoutTypes.dart';
import 'MainAppBar.dart';
import '../Game/SpaceGame.dart';
// import '../Game/Gestures/GestureHandler.dart';
// import 'package:zoom_widget/zoom_widget.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_icon_rounded_progress_bar.dart';

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
              // toolbarOpacity: 0.0,
              // bottomOpacity: 0.0,
              // brightness: Brightness.dark,
              elevation: 0,
              backgroundColor: Colors.transparent,
              // automaticallyImplyLeading: false,
              flexibleSpace: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(255, 22, 255, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(22, 255, 255, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(255, 255, 22, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(255, 22, 255, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(22, 255, 255, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
                      Container(
                          child: IconTheme.merge(
                        data: IconThemeData(
                          size: tileSize * 0.7,
                          color: Color.fromRGBO(255, 255, 22, 1.0),
                        ),
                        child: Icon(Icons.account_balance),
                      )),
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
