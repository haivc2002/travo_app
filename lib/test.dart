

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Colors.blue,
        child: const RiveAnimation.asset('assets/n2.riv'),
      ),
    );
  }
}
