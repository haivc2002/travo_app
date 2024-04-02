import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';

class ButtonCustom extends StatelessWidget {
  final String titleButtonText;
  final Color? colorButton, titleButtonColor;
  final void Function()? onTap;
  const ButtonCustom({Key? key, required this.titleButtonText, this.colorButton, this.onTap, this.titleButtonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        color: colorButton ?? ThemeColor.whiteColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Center(child: Text(titleButtonText, style: TextStyle(color: titleButtonColor, fontWeight: FontWeight.w500, fontSize: 16.sp)),),
          ),
        ),
      ),
    );
  }
}
