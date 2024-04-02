import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travo_app/model/itemImage.dart';
import 'package:travo_app/ui/hotels_screen/hotels_screen.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

import '../../../theme/theme_color.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  final String? dataReceive;
  const HomeScreen({
    Key? key, this.dataReceive
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<ItemImage> itemImage = [
    ItemImage(name: 'korea', url: 'assets/appbar_background.png', star: '4.5'),
    ItemImage(name: 'korea', url: 'assets/Bitmap.png', star: '4.5'),
    ItemImage(name: 'korea', url: 'assets/facebook.png', star: '4.5'),
    ItemImage(name: 'korea', url: 'assets/splashscreen.png', star: '4.5'),
    ItemImage(name: 'korea', url: 'assets/Bitmap.png', star: '4.5'),
    ItemImage(name: 'korea', url: 'assets/Bitmap.png', star: '4.5'),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: ThemeColor.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const AppbarCustom(),
                  Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 13),
                            filled: true,
                            hintText: 'Search your destination',
                            fillColor: ThemeColor.superWhiteColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
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
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      item(Icons.account_balance, ThemeColor.orangeColor,
                          ThemeColor.orangeColor, 'Hotels',),
                      item(Icons.airplanemode_active, ThemeColor.redFadeColor,
                          ThemeColor.redFadeColor, 'Flights',),
                      item(Icons.airplanemode_active, ThemeColor.greenFadeColor,
                          ThemeColor.greenFadeColor, 'All',),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Popular Destinations', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp)),
                    MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                Image.asset('${itemImage[index].url}'),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${itemImage[index].name}',style: const TextStyle(color: ThemeColor.whiteColor),),
                                      Container(
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.whiteColor.withOpacity(0.8),
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.star, color: Color(0xFFFFC107),),
                                              Text('${itemImage[index].star}'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                        );
                      })
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget item(IconData icon, Color colorBackground, Color colorIcon, String? dataTitle,) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HotelsScreen.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: colorBackground.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Icon(
                      icon,
                      color: colorIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(dataTitle!)
        ],
      ),
    );
  }
}
