import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/model/data_use.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/registerScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final DataUse dataUse = ModalRoute.of(context)!.settings.arguments as DataUse;
    String dropdowValue = 'one';
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarCustom(
              title: 'Sign Up',
              subTitle: 'Let’s create your account!',
              textBelow: true,
            ),
            textInputCustom('Name'),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              decoration: BoxDecoration(
                  color: ThemeColor.superWhiteColor,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: DropdownButton<String>(
                  value: dropdowValue,
                  underline: Container(
                    color: Colors.black,
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'one',
                      child: Text('one'),
                    )
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowValue = newValue!;
                    });
                  }
              ),
            ),
            textInputCustom('Phone Number'),
            textInputCustom('Email'),

            Text(dataUse.title),

            textInputCustom('Password'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By tapping sign up you agree to the',
                  style: TextStyle(
                      color: ThemeColor.blackColor
                  ),
                  children: <TextSpan>[
                    TextSpan(text: ' Terms and Condition', style: TextStyle(color: ThemeColor.purpleColor)),
                    TextSpan(text: ' and',),
                    TextSpan(text: ' Privacy Policy', style: TextStyle(color: ThemeColor.purpleColor)),
                    TextSpan(text: ' this app',),
                  ],
                ),
              ),
            ),
            // DefaultAuthBottom(title: 'Sign Up', router: () => HomeScreen.routeName),
            SizedBox(height: 100.h,),
          ],
        ),
      ),
    );
  }

  Widget textInputCustom(String? title) {
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
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h, horizontal: 13.w),
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
