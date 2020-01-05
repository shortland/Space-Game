import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'Item/ItemPages/ItemPage.dart' as ViewableItemPage;
import 'Item/ItemStore.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key key}) : super(key: key);

  // TODO: when at the edge tabs of the item tabbed menu - will scroll back to main menu
  // _horizontalSwipe(SwipeDirection direction) {
  //   if (direction == SwipeDirection.left) {
  //     print('Swiped left!');
  //   } else {
  //     print('Swiped right!');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      // Center(
      //   child: SimpleGestureDetector(
      //     // onVerticalSwipe: (_) => print("vertical swipe detected"),
      //     onHorizontalSwipe: _horizontalSwipe,
      //     swipeConfig: SimpleSwipeConfig(
      //       verticalThreshold: 40.0,
      //       horizontalThreshold: 40.0,
      //       swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
      //     ),
      //     child: ViewableItemPage.ItemPage(itemType: ItemType.TYPE_ONE),
      //   ),
      // ),
      Center(
        child: ViewableItemPage.ItemPage(itemType: ItemType.TYPE_ONE),
      ),
      Center(
        child: ViewableItemPage.ItemPage(itemType: ItemType.TYPE_TWO),
      ),
      Center(
        child: ViewableItemPage.ItemPage(itemType: ItemType.TYPE_THREE),
      ),
    ];

    final _kTabs = <Tab>[
      Tab(
        icon: Icon(Icons.cloud),
        text: 'Type 1',
      ),
      Tab(
        icon: Icon(Icons.alarm),
        text: 'Type 2',
      ),
      Tab(
        icon: Icon(Icons.forum),
        text: 'Type 3',
      ),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Item Inventory'),
          backgroundColor: Colors.blue[900],
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
        // body: SimpleGestureDetector(
        //   onVerticalSwipe: (_) => print("vertical swipe detected"),
        //   onHorizontalSwipe: _horizontalSwipe,
        //   swipeConfig: SimpleSwipeConfig(
        //     verticalThreshold: 40.0,
        //     horizontalThreshold: 40.0,
        //     swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
        //   ),
        //   child: TabBarView(
        //     children: _kTabPages,
        //   ),
        // ),
      ),
    );
  }
}
