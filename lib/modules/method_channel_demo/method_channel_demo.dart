import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/res/colors.dart';
import 'package:flutter_learn/res/strings.dart';
import 'package:flutter_learn/utlis/custom_widgets/custom_text.dart';
import 'package:flutter_learn/utlis/helpers/global.dart';

class MethodChannelDemo extends StatefulWidget {
  const MethodChannelDemo({super.key});

  @override
  State<MethodChannelDemo> createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  static const platform = MethodChannel('samples.flutter.dev/demo_channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            _callMethodChannel();
          },
          child: const CustomText(title: 'title'),
        ),
      ),
    );
  }

  _callMethodChannel() async {
    String data = "";
    try {
      final String result = await platform.invokeMethod('getData');
      data = result;
      printDebug(data);
    } catch (e) {
      data = e.toString();
    }
  }
}
