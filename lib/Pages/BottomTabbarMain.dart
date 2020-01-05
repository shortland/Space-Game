import 'package:flutter/material.dart';

import '../Game/SpaceGame.dart';
import 'GamePage.dart';

class BottomTabbarMain extends StatefulWidget {
  final SpaceGame game;

  const BottomTabbarMain({
    Key key,
    this.game,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarMainState(game);
}

class _BottomTabbarMainState extends State<BottomTabbarMain>
    with SingleTickerProviderStateMixin {
  final SpaceGame _game;
  TabController _tabController;

  _BottomTabbarMainState(this._game) {
    _initTabPages();
  }

  var _kTabPages = <Widget>[];

  void _initTabPages() {
    _kTabPages.addAll([
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: GamePage(
                game: _game,
              ),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Items"),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Map"),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Army"),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Alliance"),
            ),
          ],
        ),
      ),
    ]);
  }

  static const _kTabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.cloud,
        size: 22,
      ),
      text: 'Game',
    ),
    Tab(
      icon: Icon(
        Icons.alarm,
        size: 22,
      ),
      text: 'Items',
    ),
    Tab(
      icon: Icon(
        Icons.map,
        size: 22,
      ),
      text: 'Map',
    ),
    Tab(
      icon: Icon(
        Icons.directions_boat,
        size: 22,
      ),
      text: 'Army',
    ),
    // NOTE: chat will be a sliver bar above the bottom bar viewable in ~some~ views only
    // Tab(
    //   icon: Icon(
    //     Icons.forum,
    //     size: 22,
    //   ),
    //   text: 'Chat',
    // ),
    Tab(
      icon: Icon(
        Icons.account_balance,
        size: 22,
      ),
      text: 'Alliance',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue[900],
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
