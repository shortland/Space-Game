import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

import 'OptionsData.dart';
import 'GridData.dart';

part 'DataObj.g.dart';

@JsonSerializable()
class DataObj {
  bool showTutorial;
  String id;
  String username;
  OptionsData options;
  GridData grid;

  DataObj() {
    showTutorial = true;
    username = "N/A";
    id = Uuid().v4();
    options = OptionsData();
    grid = GridData();
  }

  factory DataObj.fromJson(Map<String, dynamic> json) =>
      _$DataObjFromJson(json);

  Map<String, dynamic> toJson() => _$DataObjToJson(this);

  static DataObj merge(DataObj s1, DataObj s2) {
    return new DataObj()
      ..showTutorial = s1.showTutorial || s2.showTutorial
      ..id = s1.id ?? s2.id
      ..username = s1.username ?? s2.username
      ..options = s1.options ?? s2.options
      ..grid = s1.grid ?? s2.grid;
  }
}
