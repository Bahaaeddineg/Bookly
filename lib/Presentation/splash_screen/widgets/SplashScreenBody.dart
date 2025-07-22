import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Theme/themes.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    initFadingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    doneFadingAnimation();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Bookly",
          style: AppTheme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return FadeTransition(
                opacity: animationController,
                child: Text(
                  "Read everywhere!",
                  style: AppTheme.textTheme.titleMedium!
                      .copyWith(color: AppColors.kPink),
                  textAlign: TextAlign.center,
                ),
              );
            })
      ],
    );
  }

  initFadingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.forward();
  }

  doneFadingAnimation() {
    animationController.dispose();
  }

  navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed("/home"),
    );
  }
}
