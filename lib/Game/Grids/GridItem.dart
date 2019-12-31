import 'package:json_annotation/json_annotation.dart';
import 'dart:ui';

import '../Gestures/Tappable.dart';

part 'GridItem.g.dart';

// NOTE: 1 structure can be multiple gridItems wide. SO it's better to keep this pretty abstract and not too specific.
@JsonSerializable()
class GridItem implements Tappable {
  Size size;

  // indices of the 2d array
  int x;
  int y;

  // true if the user can tap on this item for an event
  bool isTappable = false;

  // TODO:
  // if true, a tap event will work ok the whole griditem
  // if false, then either not tappable at all (isTappable should be false),
  // or a tap event can occur on part of it. (make sub grid in each grid item)
  //bool tapUsesWholeSpace = false;

  // TODO:
  // Subgrid if using...
  // ...

  GridItem(this.x, this.y, {this.size, this.isTappable});

  factory GridItem.fromJson(Map<String, dynamic> json) =>
      _$GridItemFromJson(json);

  Map<String, dynamic> toJson() => _$GridItemToJson(this);

  @override
  void onTapDown() {}

  @override
  void onTapUp() {
    if (!isTappable) {
      return;
    }

    print("Tapped on grid item at: " + x.toString() + "with y:" + y.toString());
  }
}
