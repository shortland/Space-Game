// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataObj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataObj _$DataObjFromJson(Map<String, dynamic> json) {
  return DataObj()
    ..showTutorial = json['showTutorial'] as bool
    ..id = json['id'] as String
    ..username = json['username'] as String
    ..options = json['options'] == null
        ? null
        : OptionsData.fromJson(json['options'] as Map<String, dynamic>)
    ..grid = json['grid'] == null
        ? null
        : GridData.fromJson(json['grid'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DataObjToJson(DataObj instance) => <String, dynamic>{
      'showTutorial': instance.showTutorial,
      'id': instance.id,
      'username': instance.username,
      'options': instance.options,
      'grid': instance.grid,
    };
