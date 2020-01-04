import 'dart:ui';

import 'package:box2d_flame/box2d.dart';

import 'Building.dart';
import '../../Mixins/HasGameRef.dart';
import '../../Data/GridData.dart';
import '../Structures/HollowRectangleStructure.dart';

// like a controller class/obj for the structures
class GridBuilding extends Building with HasGameRef {
  GridData grid;
  Size gridItemSize;
  bool created = false;

  // for rendering from main game
  List<HollowRectangleStructure> structs = [];

  GridBuilding(this.grid, Size size) : super(size);

  // TODO: instead of recreating the grid here - we should add the HOllowRectangularStructure to a 2D-List so we can later access them
  void createGrid() {
    if (created == true) {
      print("unable to create grid, created already");
      return;
    }

    created = true;

    gridItemSize = Size(size.width / 9, size.width / 9);

    int i = 0;
    int j;
    for (var gridItemList in grid.grid) {
      j = 0;
      for (var gridItem in gridItemList) {
        // something like if gridItem != null then draw rectangle with green border?
        Vector2 position = Vector2(j * gridItemSize.width,
            size.height - ((i + 1) * gridItemSize.width));

        var rect =
            HollowRectangleStructure(gridItemSize, position, wallWidth: 10);
        structs.add(rect);

        j++;
      }

      i++;
    }
  }
}
