import 'package:flutter/material.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';
import '../../res/strings.dart';
import '../../utlis/custom_widgets/custom_text.dart';
import '../../utlis/helpers/route.dart';
import 'screen5.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  void _onPresseEvent(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Screen5(),
        settings:
            const RouteSettings(name: AppRoutes.screen5, arguments: 'screen5'),
      ),
      (route) {
        return route.settings.name == AppRoutes.screen2;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.indigo,
      body: Center(
        child: TextButton(
          onPressed: () {
            _onPresseEvent(context);
          },
          child: const CustomText(
            title: AppStrings.screen4,
            fontSize: AppDimen.size30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
