import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static final PreferenceHelper prefs = PreferenceHelper._internal();
  PreferenceHelper._internal();
  factory PreferenceHelper() => prefs;
  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  setBool({required String key, required bool value}) {
    _sharedPreferences?.setBool(key, value);
  }
}
