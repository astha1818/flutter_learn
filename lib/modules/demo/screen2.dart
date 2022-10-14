import 'package:flutter/material.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';
import '../../res/strings.dart';
import '../../utlis/custom_widgets/custom_text.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  void _onPresseEvent(BuildContext context) {
    Navigator.of(context).pop('Back to Screen1');

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const Screen3(),
    //     settings:
    //         const RouteSettings(name: AppRoutes.screen3, arguments: 'screen3'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: TextButton(
          onPressed: () {
            _onPresseEvent(context);
          },
          child: CustomText(
            title: widget.name ?? AppStrings.screen2,
            fontSize: AppDimen.size30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
