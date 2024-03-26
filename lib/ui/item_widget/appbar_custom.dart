import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';

class AppbarCustom extends StatelessWidget {
  final bool textBelow;
  final bool itemRight;
  const AppbarCustom({Key? key, this.textBelow = false, this.itemRight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: ThemeColor.whiteColor,
          image: DecorationImage(
              image: AssetImage('assets/appbar_background.png'),
              fit: BoxFit.cover
          )
        ),
        child: Row(
          children: [
            SizedBox(width: 50.w, child: buttonBack(context)),
            titleText('Login', 'Hi, Welcome back!', textBelow),
            SizedBox(width: 50.w, child: item(context)),
          ],
        ),
      ),
    );
  }

  Widget buttonBack(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Visibility(
            visible: Navigator.canPop(context) ? true : false,
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                color: ThemeColor.superWhiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleText(String? title, String? subTitle, bool textBelow) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(visible: textBelow, child: const Spacer()),
            Text(title ?? '', style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: ThemeColor.whiteColor),),
            Text(subTitle ?? '', style: const TextStyle(color: ThemeColor.whiteColor)),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context) {
    return Visibility(
      visible: itemRight,
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Visibility(
              visible: Navigator.canPop(context) ? true : false,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: ThemeColor.superWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
