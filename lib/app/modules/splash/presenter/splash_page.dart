import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController cAnimationUp, cAnimationVertical;
  late Animation<double> animationUp, animationVertical;
  late Animation<Offset> animationVerticalOffSet;

  @override
  void initState() {
    super.initState();

    cAnimationUp = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationUp = Tween<double>(begin: 0, end: 200).animate(cAnimationUp);

    cAnimationUp.forward();

    cAnimationVertical = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationVertical =
        Tween<double>(begin: 0, end: 200).animate(cAnimationVertical);

    animationVerticalOffSet = Tween<Offset>(
      begin: const Offset(16, 0),
      end: const Offset(0, 0),
    ).animate(cAnimationVertical);

    if (cAnimationUp.isCompleted) {
      cAnimationVertical.forward();

      cAnimationVertical.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: cAnimationUp,
                builder: (_, __) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 60,
                      height: animationUp.value,
                      color: Colors.red,
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: cAnimationVertical,
                builder: (_, __) {
                  return AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 60,
                      height: animationVertical.value,
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
