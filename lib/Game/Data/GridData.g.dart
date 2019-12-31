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

Map<String, dynamic> _$GridDataToJson(GridData instance) => <String, dynamic>{
      'grid': instance.grid,
    };
