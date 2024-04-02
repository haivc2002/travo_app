import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/auth/register_screen.dart';
import 'package:travo_app/ui/home_screen/home_screen.dart';

import '../../model/data_use.dart';
import '../item_widget/appbar_custom.dart';
import '../item_widget/default_auth_bottom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController textData = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarCustom(
              textBelow: true,
              title: 'Login',
              subTitle: 'Hi, Welcom e back!',
            ),
            textInputCustom('Email'),
            textInputCustom('Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Checkbox(
                    splashRadius: 10,
                    activeColor: ThemeColor.superWhiteColor,
                    checkColor: ThemeColor.purpleColor,
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  const Text('Remember me'),
                  const Spacer(),
                  const Text('Forgot password?')
                ],
              ),
            ),
            DefaultAuthBottom(title: 'Log In', router: () => HomeScreen.routeName),
            SizedBox(height: 20.h,),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName, arguments: DataUse('dddddddd'));
                },
              child: RichText(
                text: const TextSpan(
                  text: 'Don’t have an account?',
                  style: TextStyle(
                    color: ThemeColor.blackColor
                  ),
                  children: <TextSpan>[
                    TextSpan(text: ' Sign Up', style: TextStyle(color: ThemeColor.purpleColor, fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget textInputCustom(String? title,) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      decoration: BoxDecoration(
        color: ThemeColor.superWhiteColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          TextField(
            controller: textData,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 13),
              filled: true,
              fillColor: ThemeColor.superWhiteColor,
              labelText: title ?? '',
              labelStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.blue,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onChanged: (text) {},
          )
        ],
      ),
    );
  }

}
