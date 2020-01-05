import 'package:flutter/foundation.dart';

enum LayoutGroup {
  nonScrollable,
  scrollable,
}

abstract class HasLayoutGroup {
  LayoutGroup get layoutGroup;
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  gameView,
  tabbedView,
  baseline,
  expanded,
  pageView,
  list,
}

Map<LayoutType, String> layoutNames = {
  LayoutType.gameView: 'Game',
  LayoutType.tabbedView: 'Tabbed',
  LayoutType.baseline: 'Baseline',
  LayoutType.expanded: 'Expanded',
  LayoutType.pageView: 'Page View',
  LayoutType.list: 'List',
};
