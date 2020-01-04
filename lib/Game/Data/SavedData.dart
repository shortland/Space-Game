import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'DataObj.dart';

class SavedData {
  static const SAVE_NAME = 'spacegame.data';

  static Future save(Object data) async {
    String dataString = json.encode(data);
    return await _saveData(dataString);
  }

  static Future load() async {
    return await _loadData();
  }

  static Future<Object> _saveData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SAVE_NAME, data);
  }

  static Future<Object> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(SAVE_NAME)) {
      return json.decode(prefs.getString(SAVE_NAME));
    } else {
      print("new account settings loading");
      return DataObj();
    }
  }
}
