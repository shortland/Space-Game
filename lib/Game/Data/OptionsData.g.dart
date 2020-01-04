// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OptionsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsData _$OptionsDataFromJson(Map<String, dynamic> json) {
  return OptionsData()
    ..enableSound = json['enableSound'] as bool
    ..showOffline = json['showOffline'] as bool
    ..someNumber = (json['someNumber'] as num)?.toDouble();
}

Map<String, dynamic> _$OptionsDataToJson(OptionsData instance) =>
    <String, dynamic>{
      'enableSound': instance.enableSound,
      'showOffline': instance.showOffline,
      'someNumber': instance.someNumber,
    };
