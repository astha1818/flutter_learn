import 'package:flutter/material.dart';
import 'package:flutter_learn/utlis/helpers/route.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';
import '../../res/strings.dart';
import '../../utlis/custom_widgets/custom_text.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  void _onPresseEvent(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName(AppRoutes.screen1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: TextButton(
          onPressed: () {
            _onPresseEvent(context);
          },
          child: const CustomText(
            title: AppStrings.screen5,
            fontSize: AppDimen.size30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
