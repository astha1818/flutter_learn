import 'package:flutter_learn/utlis/helpers/preferences/preference_helper.dart';

class Preference {
  static setIsTutorialViewed(bool value) {
    PreferenceHelper.prefs.setBool(
      key: PreferenceKey.isTutorialViewed,
      value: value,
    );
  }

  static bool? get isTutorialViewed {
    return PreferenceHelper.prefs.getBool(PreferenceKey.isTutorialViewed);
  }
}

class PreferenceKey {
  static const String isTutorialViewed = 'is_tutorial_viewed';
}
