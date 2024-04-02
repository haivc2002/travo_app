import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

import '../item_widget/button_custom.dart';

class SearchDestination extends StatelessWidget {
  static const routeName = '/searchDestination';
  const SearchDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: Column(
        children: [
          const AppbarCustom(
            title: 'Search your destination',
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                  decoration: BoxDecoration(
                      color: ThemeColor.superWhiteColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 13),
                      filled: true,
                      fillColor: ThemeColor.superWhiteColor,
                      hintText: 'Search your destination',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: const TextStyle(
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
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const Icon(Icons.my_location),
                      SizedBox(width: 20.w),
                      const Text('Search nearby destination')
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: ButtonCustom(
                    titleButtonText: 'Search',
                    colorButton: ThemeColor.purpleColor,
                    onTap: () {},
                  ),
                ),

                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset('assets/mmmm.riv'),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
