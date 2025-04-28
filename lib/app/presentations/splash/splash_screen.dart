import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_contact/app/presentations/onboarding/onboarding_screen.dart';
import 'package:get_contact/app/presentations/splash/splash_notifier.dart';
import 'package:get_contact/core/helper/global_helper.dart';
import 'package:get_contact/core/widgets/app_widget.dart';

class SplashScreen extends AppWidget<SplashNotifier, void, void> {
  @override
  void checkVariableAfterUi(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    final onBoarding = await notifier.isOnboarding;

    if (!onBoarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    } else {}
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalHelper.getColorSchema(context).primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti ini dengan logo kamu
            Image.asset(
              "assets/img/cbi.png",
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
