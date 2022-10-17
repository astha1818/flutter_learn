import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../utlis/helpers/preferences/preference_helper.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PreferenceHelper().init;
  runApp(const MyApp());
}
