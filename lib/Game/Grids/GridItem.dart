import 'dart:ui';

import 'package:flame/components/mixins/resizable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flame/components/component.dart';
import 'package:spacegame/Game/Components/Buildings/MainBaseBuilding.dart';
import 'package:spacegame/Game/Grids/GridPosition.dart';
import 'package:spacegame/Game/Grids/GridSize.dart';

import '../../Game/Mixins/HasGameRef.dart';
import '../Components/Buildings/BuildingType.dart';
import '../Gestures/Tappable.dart';

part 'GridItem.g.dart';

// NOTE: 1 structure can be multiple gridItems wide. SO it's better to keep this pretty abstract and not too specific.
@JsonSerializable()
class GridItem extends Component
    with HasGameRef, Resizable
    implements Tappable {
  BuildingType buildingType;
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

  bool hasRenderable = false;
  List<dynamic> renderable = [];

  GridItem(this.x, this.y, {this.size, this.buildingType, this.isTappable}) {
    _create();
  }

  void _create() {
    // TODO:
    switch (buildingType) {
      case BuildingType.MAIN1:
        {
          // TODO:
          // renderable.add(MainBaseBuilding(GridPosition(1, 5), GridSize(1, 1)));
          hasRenderable = true;
          print("tried making building type main1");
          print("renderable has size: (after adding!)" +
              renderable.length.toString());
        }
        break;

      case BuildingType.MAIN2:
        {
          print("tried making building type main2");
        }
        break;

      case BuildingType.MAIN3:
        {
          print("tried making building type main3");
        }
        break;

      default:
        {
          print("tried making a building type of unknown");
        }
    }
  }

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

  @override
  void resize(Size size) {}

  @override
  void render(Canvas c) {
    // print("called render on a griditem");
    if (hasRenderable) {
      print("has renderable items!");
    }

    print("items in renderable: " + renderable.length.toString());

    for (var strct in renderable) {
      print("trying to render the contents of a grid item");
      strct.render(c);
    }
  }

  @override
  void update(double dt) {}
}
