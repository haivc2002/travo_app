import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travo_app/theme/theme_color.dart';

class DefaultAuthBottom extends StatelessWidget {
  final String? title;
  final String Function() router;
  const DefaultAuthBottom({Key? key, required this.title, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('skipScreen', true);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  router(),
                      (route) => false,
                );
                // Navigator.pushNamedAndRemoveUntil(context, router(), (route) => false, arguments: textData);
              },
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: ThemeColor.purpleColor,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child: Text(title ?? '', style: TextStyle(color: ThemeColor.superWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w500),),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(child: Container(height: 1, color: ThemeColor.lineGrayColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('or ${title ?? ''} with'),
                ),
                Expanded(child: Container(height: 1, color: ThemeColor.lineGrayColor,)),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: ThemeColor.superWhiteColor,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(child: Image.asset('assets/google.png', height: 22,)),
                  ),
                ),
                SizedBox(width: 10.h,),
                Expanded(
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ThemeColor.blurFBColor,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(child: Image.asset('assets/facebook.png', height: 22,)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
