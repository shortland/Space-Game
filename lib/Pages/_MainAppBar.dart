import 'package:flutter/material.dart';

import '../LayoutTypes.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    LayoutGroup layoutGroup,
    LayoutType layoutType,
    PreferredSize bottom,
    VoidCallback onLayoutToggle,
  }) : super(
          leading: IconButton(
            icon: Icon(Icons.account_box),
            tooltip: 'Profile',
            onPressed: onLayoutToggle,
          ),
          flexibleSpace: FlexibleSpaceBar(stretchModes: [
            StretchMode.zoomBackground,
          ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_box),
              tooltip: 'Profile',
              onPressed: onLayoutToggle,
            ),
            IconButton(
              icon: Icon(Icons.account_box),
              tooltip: 'Profile',
              onPressed: onLayoutToggle,
            ),
          ],
          elevation: 1.0,
          bottom: bottom,
        );
}
