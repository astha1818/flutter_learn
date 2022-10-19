import 'package:flutter/material.dart';
import '../../res/images.dart';
import '../../utlis/helpers/preferences/preference.dart';
import '../../utlis/helpers/route.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';
import '../../utlis/custom_widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  _navigateToNextScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        bool isTutorialViewed = Preference.isTutorialViewed ?? false;
        if (isTutorialViewed) {
          Navigator.of(context).pushNamed(AppRoutes.loginScreen);
        } else {
          Navigator.of(context).pushNamed(AppRoutes.tutorialScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashScreen,
              width: AppDimen.size100,
              height: AppDimen.size100,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: AppDimen.size20,
            ),
            const CustomText(
              title: 'Splash Screen',
              fontSize: AppDimen.size30,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
