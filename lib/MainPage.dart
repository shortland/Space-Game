import 'package:flutter/material.dart';
import 'package:spacegame/Game/SpaceGame.dart';
import 'package:spacegame/Pages/BottomTabbarMain.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'Pages/BaselinePage.dart';
import 'Pages/ExpandedPage.dart';
import 'LayoutTypes.dart';
import 'Pages/ListPage.dart';
import 'Pages/PageViewPage.dart';
import 'Pages/GamePage.dart';

class MainPage extends StatefulWidget {
  final SpaceGame game;

  MainPage({Key key, this.game}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(game);
}

class _MainPageState extends State<MainPage> {
  final SpaceGame _game;
  _MainPageState(this._game);

  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
  LayoutType _layoutSelection1 = LayoutType.gameView;
  LayoutType _layoutSelection2 = LayoutType.tabbedView;
  LayoutType get _layoutSelection => _layoutGroup == LayoutGroup.nonScrollable
      ? _layoutSelection1
      : _layoutSelection2;

  void _onLayoutGroupToggle() {
    setState(() {
      _layoutGroup = _layoutGroup == LayoutGroup.nonScrollable
          ? LayoutGroup.scrollable
          : LayoutGroup.nonScrollable;
    });
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      if (_layoutGroup == LayoutGroup.nonScrollable) {
        _layoutSelection1 = selection;
      } else {
        _layoutSelection2 = selection;
      }
    });
  }

  void _onSelectTab(int index) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      _onLayoutSelected(LayoutType.values[index]);
    } else {
      // `+ X` : X number of pages on first botbar page that are nonscollables
      _onLayoutSelected(LayoutType.values[index + 4]);
    }
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return _layoutSelection1 == layoutSelection ? Colors.white : Colors.grey;
    } else {
      return _layoutSelection2 == layoutSelection ? Colors.white : Colors.grey;
    }
  }

  BottomNavigationBarItem _buildItem({
    IconData icon,
    LayoutType layoutSelection,
  }) {
    String text = layoutNames[layoutSelection];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildBody() {
    // set the height of the bottom bar (1/9 of the screen width)
    // botBarHeight = (MediaQuery.of(context).size.width / 9.0) + 10.0;
    // _game.barHeight = botBarHeight;

    return <LayoutType, WidgetBuilder>{
      LayoutType.gameView: (_) => GamePage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
            game: _game,
          ),
      LayoutType.tabbedView: (_) => BottomTabbarMain(),
      LayoutType.baseline: (_) => BaselinePage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      LayoutType.expanded: (_) => ExpandedPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
      // LayoutType.pageView: (_) => PageViewPage(
      //       layoutGroup: _layoutGroup,
      //       onLayoutToggle: _onLayoutGroupToggle,
      //     ),
      LayoutType.list: (_) => ListPage(
            layoutGroup: _layoutGroup,
            onLayoutToggle: _onLayoutGroupToggle,
          ),
    }[_layoutSelection](context);
  }

  Widget _buildBottomNavigationBar() {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            _buildItem(
              icon: Icons.games,
              layoutSelection: LayoutType.gameView,
            ),
            _buildItem(
              icon: Icons.format_size,
              layoutSelection: LayoutType.baseline,
            ),
            _buildItem(
              icon: Icons.line_weight,
              layoutSelection: LayoutType.expanded,
            ),
          ],
          onTap: _onSelectTab,
          backgroundColor: Color.fromRGBO(8, 17, 75, 1.0));
    } else {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
            icon: Icons.view_week,
            layoutSelection: LayoutType.tabbedView,
          ),
          _buildItem(
            icon: Icons.format_list_bulleted,
            layoutSelection: LayoutType.list,
          ),
        ],
        onTap: _onSelectTab,
      );
    }
  }

  _horizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      print('Swiped left!');
    } else {
      print('Swiped right!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SimpleGestureDetector(
          onVerticalSwipe: (_) => print("vertical swipe detected"),
          onHorizontalSwipe: _horizontalSwipe,
          swipeConfig: SimpleSwipeConfig(
            verticalThreshold: 40.0,
            horizontalThreshold: 40.0,
            swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
          ),
          child: _buildBody(),
        ),
        bottomNavigationBar: Container(
          child: _buildBottomNavigationBar(),
        ));
  }
}
