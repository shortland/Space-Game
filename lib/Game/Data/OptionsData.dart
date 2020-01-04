import 'package:json_annotation/json_annotation.dart';

part 'OptionsData.g.dart';

@JsonSerializable()
class OptionsData {
  bool enableSound;
  bool showOffline;
  double someNumber;

  OptionsData() {
    this.enableSound = true;
    this.showOffline = false;
    this.someNumber = 12.0;
  }

  factory OptionsData.fromJson(Map<String, dynamic> json) =>
      _$OptionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsDataToJson(this);

  OptionsData clone() {
    return OptionsData.fromJson(toJson());
  }
}
