import 'dart:ui';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _containerHeight = 0;
  double _containerHeight2 = 0;
  bool _disposed = false;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _containerHeight = MediaQuery.of(context).size.height*1.2;
        _containerHeight2 = 150;
      });
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (!_disposed) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const OnBoardingScreen(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splashscreen.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                AnimatedContainer(
                  height: _containerHeight,
                  color: Colors.white,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 0),
                      height: _containerHeight2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.white.withOpacity(0)],
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}

