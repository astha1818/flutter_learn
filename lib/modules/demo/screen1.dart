import 'package:flutter/material.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';
import '../../res/strings.dart';
import '../../utlis/custom_widgets/custom_text.dart';
import '../../utlis/helpers/route.dart';
import 'screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String? name;
  Future<void> _onPresseEvent(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Screen2(name: 'Moved to Screen2'),
        settings:
            const RouteSettings(name: AppRoutes.screen2, arguments: 'screen2'),
      ),
    );

    // final result = await Navigator.of(context).pushNamed(
    //   AppRoutes.screen2,
    //   arguments: {'name': 'Moved to Screen2'},
    // );

    setState(() {
      name = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: TextButton(
          onPressed: () {
            _onPresseEvent(context);
          },
          child: CustomText(
            title: name ?? AppStrings.screen1,
            fontSize: AppDimen.size30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
