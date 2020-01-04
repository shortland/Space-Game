import 'dart:ui';

import 'package:box2d_flame/box2d.dart';

import 'Building.dart';
import '../../Mixins/HasGameRef.dart';
import '../../Data/GridData.dart';
import '../Structures/HollowRectangleStructure.dart';
import '../../Grids/GridItem.dart';

// like a controller class/obj for the structures
class GridBuilding extends Building with HasGameRef {
  GridData grid;
  Size gridItemSize;
  bool created = false;
  double gridWallWidth = 10;

  // for rendering from main game
  List<HollowRectangleStructure> structs = [];

  // for later access
  List<List<GridItem>> gridItems = [];

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
      gridItems.insert(i, []);

      j = 0;
      for (var gridItem in gridItemList) {
        // add to our gridItems list<list>>..
        gridItems[i].insert(j, gridItem);

        // something like if gridItem != null then draw rectangle with green border?
        Vector2 position = Vector2(j * gridItemSize.width,
            size.height - ((i + 1) * (gridItemSize.height + 0)));

        print("the size of the screen is w:" +
            size.width.toString() +
            ", h:" +
            size.height.toString());

        var rect = HollowRectangleStructure(gridItemSize, position,
            wallWidth: gridWallWidth);
        structs.add(rect);

        j++;
      }

      i++;
    }

    while (gridItems.length * gridItemSize.height < size.height) {
      print("loaded a grid that's shorter than it can be. growing grid height");
      growGridHeightOnce();
    }
  }

  void growGridHeightOnce() {
    gridItems.add([]);

    for (int i = 0; i < 9; i++) {
      gridItems[gridItems.length - 1].insert(i, null);

      Vector2 position = Vector2(i * gridItemSize.width,
          size.height - ((gridItems.length) * (gridItemSize.height + 0)));
      structs.add(HollowRectangleStructure(gridItemSize, position,
          wallWidth: gridWallWidth));
    }
  }
}
