// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GridData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridData _$GridDataFromJson(Map<String, dynamic> json) {
  return GridData()
    ..grid = (json['grid'] as List)
        ?.map((e) => (e as List)
            ?.map((e) =>
                e == null ? null : GridItem.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList();
}

// Map<String, dynamic> _$GridDataToJson(GridData instance) {
//   Iterable<List<List<String>>> gridData;

//   gridData = instance.grid.map((gridList) => (gridList as List)
//       ?.map((gridList) => (gridList as List)
//           ?.map((gridList) => gridList == null ? null : gridList.toString())
//           ?.toList())
//       ?.toList());

//   print("THIS IS WHAT GRIDDATA TO JSON LOOKS LIKE" + gridData.toString());

//   return <String, dynamic>{
//     'grid': gridData,
//   };
// }

// Map<String, dynamic> _$GridDataToJson(GridData instance) => instance.toJson();
