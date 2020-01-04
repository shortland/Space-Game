import 'package:flutter/material.dart';

import '../LayoutTypes.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    LayoutGroup layoutGroup,
    LayoutType layoutType,
    PreferredSize bottom,
    VoidCallback onLayoutToggle,
  }) : super(
          // leading: IconButton(
          //   icon: Icon(layoutGroup == LayoutGroup.nonScrollable
          //       ? Icons.filter_1
          //       : Icons.filter_2),
          //   onPressed: onLayoutToggle,
          // ),
          leading: IconButton(
            icon: Icon(Icons.account_box),
            tooltip: 'Profile',
            onPressed: onLayoutToggle,
          ),
          flexibleSpace: FlexibleSpaceBar(stretchModes: [
            StretchMode.zoomBackground,
          ]),
          actions: <Widget>[
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     IconRoundedProgressBar(
            //       widthIconSection: 70,
            //       icon: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Icon(Icons.monetization_on, color: Colors.white)),
            //       style: RoundedProgressBarStyle(
            //           colorBackgroundIcon: Color(0xffc0392b),
            //           colorProgress: Color(0xffe74c3c),
            //           colorProgressDark: Color(0xffc0392b),
            //           colorBorder: Color(0xff2c3e50),
            //           backgroundProgress: Color(0xff4a627a),
            //           borderWidth: 4,
            //           widthShadow: 6),
            //       margin: EdgeInsets.symmetric(vertical: 16),
            //       borderRadius: BorderRadius.circular(6),
            //       percent: 80.0,
            //     ),
            //     IconRoundedProgressBar(
            //       widthIconSection: 70,
            //       icon: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Icon(Icons.monetization_on, color: Colors.white)),
            //       style: RoundedProgressBarStyle(
            //           colorBackgroundIcon: Color(0xffc0392b),
            //           colorProgress: Color(0xffe74c3c),
            //           colorProgressDark: Color(0xffc0392b),
            //           colorBorder: Color(0xff2c3e50),
            //           backgroundProgress: Color(0xff4a627a),
            //           borderWidth: 4,
            //           widthShadow: 6),
            //       margin: EdgeInsets.symmetric(vertical: 16),
            //       borderRadius: BorderRadius.circular(6),
            //       percent: 24.0,
            //     ),
            //   ],
            // ),
            // Center(
            //   child: RoundedProgressBar(
            //       childLeft: Text("70%", style: TextStyle(color: Colors.white)),
            //       percent: 70,
            //       theme: RoundedProgressBarTheme.green),
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     IconButton(
            //       icon: Icon(Icons.account_box),
            //       tooltip: 'Profile',
            //       onPressed: onLayoutToggle,
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.account_box),
            //       tooltip: 'Profile',
            //       onPressed: onLayoutToggle,
            //     ),
            //   ],
            // ),
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
          // title: Text(layoutNames[layoutType]),
          elevation: 1.0,
          bottom: bottom,
        );
}
