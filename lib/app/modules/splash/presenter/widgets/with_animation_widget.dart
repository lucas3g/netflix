import 'package:flutter/material.dart';

class WithAnimationWidget extends StatefulWidget {
  const WithAnimationWidget({super.key});

  @override
  State<WithAnimationWidget> createState() => _WithAnimationWidgetState();
}

class _WithAnimationWidgetState extends State<WithAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController cAnimationUp, cAnimationDown, cAnimationVertical;
  late Animation<double> animationUp, animationVertical, animationDown;
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
        Tween<double>(begin: 0, end: 400).animate(cAnimationVertical);

    animationVerticalOffSet = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(cAnimationVertical);

    cAnimationDown = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationDown = Tween<double>(begin: 0, end: 200).animate(cAnimationDown);

    cAnimationUp.addListener(() {
      if (cAnimationUp.isCompleted) {
        cAnimationVertical.forward();

        cAnimationVertical.addListener(() {
          if (cAnimationVertical.isCompleted) {
            cAnimationDown.forward();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                AnimatedBuilder(
                  animation: cAnimationUp,
                  builder: (_, __) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 50,
                        height: animationUp.value,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: cAnimationVertical,
                  builder: (_, __) {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.only(top: 30),
                      duration: const Duration(milliseconds: 200),
                      transform: Transform.rotate(
                        angle: -0.45,
                      ).transform,
                      width: 50,
                      height: animationVertical.value,
                    );
                  },
                ),
              ],
            ),
            AnimatedBuilder(
              animation: cAnimationDown,
              builder: (_, __) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 50,
                    height: animationDown.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
