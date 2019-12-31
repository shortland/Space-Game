import 'package:json_annotation/json_annotation.dart';

import '../Grids/GridItem.dart';

part 'GridData.g.dart';

@JsonSerializable()
class GridData {
  List<List<GridItem>> grid = [];

  GridData() {
    // TODO: the height is dynamic per device... we can keep width at 9 gridItems wide, but the height is different.
    // the array is also flipped... so the top of this array is the bototm of the visual grid
    this.grid = [
      [
        null,
        null,
        null,
        GridItem(0, 3, isTappable: true),
        GridItem(0, 4, isTappable: true),
        GridItem(0, 5, isTappable: true),
        null,
        null,
        null
      ],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null, null, null],
    ];
  }

  factory GridData.fromJson(Map<String, dynamic> json) =>
      _$GridDataFromJson(json);

  Map<String, dynamic> toJson() => _$GridDataToJson(this);

  GridData clone() {
    return GridData.fromJson(toJson());
  }
}
