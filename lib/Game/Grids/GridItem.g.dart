// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GridItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridItem _$GridItemFromJson(Map<String, dynamic> json) {
  return GridItem(
    json['x'] as int,
    json['y'] as int,
    size: json['size'],
    isTappable: json['isTappable'] as bool,
  );
}

Map<String, dynamic> _$GridItemToJson(GridItem instance) => <String, dynamic>{
      'size': instance.size,
      'x': instance.x,
      'y': instance.y,
      'isTappable': instance.isTappable,
    };
