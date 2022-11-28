import 'package:flutter/material.dart';
import 'package:netflix/app/modules/splash/presenter/widgets/my_custom_paint_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: MyCustomPaintWidget(),
    );
  }
}
