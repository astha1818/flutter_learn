import 'package:flutter/material.dart';
import '../../modules/profile/view/my_profile.dart';
import '../../modules/demo/screen1.dart';
import '../../modules/demo/screen2.dart';
import '../../modules/demo/screen3.dart';
import '../../modules/demo/screen4.dart';
import '../../modules/demo/screen5.dart';
import '../../modules/signup/view/signup.dart';
import '../../modules/tutorial/tutorial.dart';

class AppRoutes {
  static const String tutorialScreen = '/tutorialScreen';
  static const String signupScreen = '/signupScreen';
  static const String myProfileScreen = '/myProfileScreen';
  static const String screen1 = '/screen1';
  static const String screen2 = '/screen2';
  static const String screen3 = '/screen3';
  static const String screen4 = '/screen4';
  static const String screen5 = '/screen5';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      tutorialScreen: ((context) => const TutorialPage()),
      signupScreen: ((context) => const Signup()),
      myProfileScreen: ((context) => const MyProfile()),
      screen1: ((context) => const Screen1()),
      screen2: ((context) => const Screen2()),
      screen3: ((context) => const Screen3()),
      screen4: ((context) => const Screen4()),
      screen5: ((context) => const Screen5()),
    };
  }
}
