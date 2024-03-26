import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: SizedBox(
        height: 500,
        child: ListView(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(),
                  )
                ],
              ),
            ),
            Container(height: 200, color: Colors.blue,),
            Container(height: 200, color: Colors.red,),
            Container(height: 200, color: Colors.blue,),
            Container(height: 200, color: Colors.red,),
            Container(height: 200, color: Colors.blue,),
          ],
        ),
      ),
    );
  }
}
