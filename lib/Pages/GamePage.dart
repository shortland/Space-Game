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
import 'package:flushbar/flushbar.dart';

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
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                        // NOTE: if you change this, make sure to see below notes
                        margin: EdgeInsets.all(5),

                        height: tileSize * 0.5 + 4.0,
                        // alignment: Alignment.center,
                        child: Stack(
                          // padding: EdgeInsets.all(6),
                          overflow: Overflow.visible,
                          fit: StackFit.expand,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: RoundedProgressBar(
                                // childRight: Text(
                                //   "50000",
                                //   overflow: TextOverflow.visible,
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //   ),
                                // ),
                                // - 1.0 to allow space for the border top+bottom (0.5 + 0.5)
                                height: tileSize * 0.5 - 1.0,
                                style: RoundedProgressBarStyle(
                                  colorBackgroundIcon: Color(0xffc0392b),
                                  colorProgress: Color(0xffe74c3c),
                                  colorProgressDark: Color(0xffc0392b),
                                  colorBorder: Color(0xff2c3e50),
                                  backgroundProgress: Color(0xff4a627a),
                                  borderWidth: 0.5,
                                  widthShadow: 0.0,
                                ),
                                margin: EdgeInsets.symmetric(vertical: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                                percent: 80.0,
                              ),
                            ),
                            Positioned(
                              // NOTE: 10.0 b/c of the 5.0 margin that's in very parent.
                              top: ((tileSize * 0.5) / 2.0) -
                                  (((tileSize * 0.5 + 10.0) / 2.0) + 10.0),

                              // this is somewhat variable
                              left: -15.0,

                              // alignment: Alignment.topLeft,
                              child: IconButton(
                                // NOTE: see above note
                                iconSize: tileSize * 0.7 + 10.0,

                                onPressed: () {
                                  Flushbar(
                                    title: "show the profile",
                                    message:
                                        "Temporary widget, just to show that it's a clickable widget",
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: 28.0,
                                      color: Colors.blue[900],
                                    ),
                                    boxShadows: [
                                      BoxShadow(
                                        color: Colors.blue[800],
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 3.0,
                                      )
                                    ],
                                    isDismissible: false,
                                    duration: Duration(seconds: 2),
                                    leftBarIndicatorColor: Colors.blue[900],
                                  )..show(context);
                                },
                                icon: Icon(
                                  Icons.ac_unit,
                                  color: Color.fromRGBO(255, 255, 22, 1.0),
                                  // size: tileSize * 0.7,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Text(
                                "50,000",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconTheme.merge(
                          data: IconThemeData(
                            size: tileSize * 0.7,
                            color: Color.fromRGBO(22, 255, 255, 1.0),
                          ),
                          child: Icon(Icons.account_balance),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconTheme.merge(
                          data: IconThemeData(
                            size: tileSize * 0.7,
                            color: Color.fromRGBO(255, 255, 22, 1.0),
                          ),
                          child: Icon(Icons.account_balance),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconTheme.merge(
                          data: IconThemeData(
                            size: tileSize * 0.7,
                            color: Color.fromRGBO(255, 22, 255, 1.0),
                          ),
                          child: Icon(Icons.account_balance),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconTheme.merge(
                          data: IconThemeData(
                            size: tileSize * 0.7,
                            color: Color.fromRGBO(22, 255, 255, 1.0),
                          ),
                          child: Icon(Icons.account_balance),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconTheme.merge(
                          data: IconThemeData(
                            size: tileSize * 0.7,
                            color: Color.fromRGBO(255, 255, 22, 1.0),
                          ),
                          child: Icon(Icons.account_balance),
                        ),
                      ),
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
