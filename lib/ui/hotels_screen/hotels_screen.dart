import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/hotel_booking/hotel_booking.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

import '../../model/itemImage.dart';
import '../item_widget/select_hotel_or_rom.dart';

class HotelsScreen extends StatefulWidget {
  static const routeName = '/hotelsScreen';
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
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
      body: Stack(
        children: [
          const AppbarCustom(
            itemRight: true,
            dataIcon: Icons.menu,
            title: 'Hotels',
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 130.h, 20, 0),
            child: SizedBox(
              height: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20.h),
                    child: SelectHotelOrRom(
                      textButton: 'Book a room',
                      describeTypeRoom: false,
                      imageData: '${itemImage[index].url}',
                      onTap: () {
                        Navigator.pushNamed(context, HotelBooking.routeName);
                      },
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
