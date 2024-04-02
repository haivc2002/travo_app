import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/hotel_booking/search_destination.dart';
import 'package:travo_app/ui/hotel_booking/select_date_screen.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

import 'guest_and_room.dart';

class HotelBooking extends StatefulWidget {
  static const routeName = '/hotelBooking';
  const HotelBooking({Key? key}) : super(key: key);

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: Column(
        children: [
          const AppbarCustom(
            textBelow: true,
            title: 'Hotel Booking',
            subTitle: 'Choose your favorite hotel and enjoy the service',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  itemInHotelBooking(Icons.location_pin, 'Destination', 'South Korea', ThemeColor.orangeColor, SearchDestination.routeName),
                  itemInHotelBooking(Icons.calendar_month, 'Select Date', '13 Feb - 18 Feb 2021', ThemeColor.redFadeColor, SelectDateScreen.routeName ),
                  itemInHotelBooking(Icons.bed_sharp, 'Guest and Room', '2 Guest, 1 Room', ThemeColor.greenFadeColor, GuestAndRoom.routeName),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: ThemeColor.purpleColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Center(
                          child: Text('search', style: TextStyle(color: ThemeColor.superWhiteColor, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemInHotelBooking(IconData? dataIcon, String? titleText, String? subTitleText, Color colorData, String? router) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
      decoration: BoxDecoration(
        color: ThemeColor.superWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(router!);
        },
        leading: Container(
          decoration: BoxDecoration(
            color: colorData.withOpacity(0.4),
            borderRadius: BorderRadius.circular(13)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(dataIcon, color: colorData,),
          ),
        ),
        title: Text(titleText ?? '', style: TextStyle(fontSize: 12.sp),),
        subtitle: Text(subTitleText ?? '', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
