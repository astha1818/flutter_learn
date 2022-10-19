import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/counter/view/counter.dart';
import 'package:flutter_learn/modules/hero_demo/hero_demo.dart';
import '../../modules/api_ui/view/ui.dart';
import '../../modules/demo_ui/view/movie_screen.dart';
import '../../modules/google_map/google_map.dart';
import '../../modules/login/view/login.dart';
import '../../modules/method_channel_demo/method_channel_demo.dart';
import '../../modules/splash/splash.dart';
import '../../modules/profile/view/my_profile.dart';
import '../../modules/navigation_demo/screen1.dart';
import '../../modules/navigation_demo/screen2.dart';
import '../../modules/navigation_demo/screen3.dart';
import '../../modules/navigation_demo/screen4.dart';
import '../../modules/navigation_demo/screen5.dart';
import '../../modules/signup/view/signup.dart';
import '../../modules/tutorial/view/tutorial.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String tutorialScreen = '/tutorialScreen';
  static const String signupScreen = '/signupScreen';
  static const String loginScreen = '/loginScreen';
  static const String myProfileScreen = '/myProfileScreen';
  static const String screen1 = '/screen1';
  static const String screen2 = '/screen2';
  static const String screen3 = '/screen3';
  static const String screen4 = '/screen4';
  static const String screen5 = '/screen5';
  static const String googleMapScreen = '/googleMapScreen';
  static const String movieScreen = '/movieScreen';
  static const String apiUi = '/apiUi';
  static const String methodChannelDemo = '/methodChannelDemo';
  static const String counter = '/counter';
  static const String heroDemo = '/heroDemo';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: ((context) => const SplashScreen()),
      tutorialScreen: ((context) => const TutorialPage()),
      signupScreen: ((context) => const Signup()),
      loginScreen: ((context) => const Login()),
      myProfileScreen: ((context) => const MyProfile()),
      screen1: ((context) => const Screen1()),
      screen2: ((context) => const Screen2()),
      screen3: ((context) => const Screen3()),
      screen4: ((context) => const Screen4()),
      screen5: ((context) => const Screen5()),
      googleMapScreen: ((context) => const GoogleMapScreen()),
      movieScreen: ((context) => const MovieScreen()),
      apiUi: ((context) => const ApiUI()),
      methodChannelDemo: ((context) => const MethodChannelDemo()),
      counter: ((context) => const Counter()),
      heroDemo: ((context) => const HeroDemo()),
    };
  }
}
