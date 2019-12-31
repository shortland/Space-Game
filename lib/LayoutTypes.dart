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
  baseline,
  expanded,
  pageView,
  list,
}

Map<LayoutType, String> layoutNames = {
  LayoutType.baseline: 'Baseline',
  LayoutType.expanded: 'Expanded',
  LayoutType.pageView: 'Page View',
  LayoutType.list: 'List',
};
