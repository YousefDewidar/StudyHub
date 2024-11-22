import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/features/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      precacheImage(const AssetImage('assets/logo/logo_splash.png'), context);
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const HomeView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            filterQuality: FilterQuality.medium,
            'assets/logo/logo_splash.png',
            height: 200,
          ),
          const SizedBox(height: 30),
          ScaleTransition(
            scale: animation,
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: "Study",
                  style: TextStyle(
                    fontSize: 36,
                    color: MyColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: " Hub",
                      style: TextStyle(
                        fontSize: 50,
                        color: MyColors.kBackG,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
