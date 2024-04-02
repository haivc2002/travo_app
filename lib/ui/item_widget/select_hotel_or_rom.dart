import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';

class SelectHotelOrRom extends StatelessWidget {
  final String textButton;
  final bool? describeTypeRoom;
  final String imageData;
  final void Function()? onTap;
  const SelectHotelOrRom({Key? key, required this.textButton, required this.describeTypeRoom, required this.imageData, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: MediaQuery.of(context).size.height*0.45,
          color: ThemeColor.superWhiteColor,
          child: Column(
            children: [
              describeTypeRoom == false ? typeHotels() : typeRoom(),
              bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget typeHotels() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 25.w, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(imageData),
                    fit: BoxFit.cover
                )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Royal Palm Heritage', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp)),
                  itemInfoInHotels(Icons.location_on_sharp, 'Purwokerto, Jateng - ', '364 m from destination', ThemeColor.redFadeColor),
                  itemInfoInHotels(Icons.star, '4.5 ', '(3241 reviews)', ThemeColor.orangeColor),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget typeRoom() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Deluxe Room', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
                      Text('Room Size : 27 m2', style: TextStyle(fontSize: 14.sp)),
                      Text('Free Cancellation', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imageData),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal :20.w),
              child: Row(
                children: [
                  itemServiceInRoom('Free WiFi', ThemeColor.purpleColor, Icons.wifi),
                  const Spacer(),
                  itemServiceInRoom('Non-Refundable', ThemeColor.orangeColor, Icons.attach_money),
                  const Spacer(),
                  itemServiceInRoom('Free Breakfast', ThemeColor.redFadeColor, Icons.fastfood),
                  const Spacer(),
                  itemServiceInRoom('Non-Smoking', ThemeColor.greenFadeColor, Icons.smoking_rooms),

                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget bottom() {
    return Column(
      children: [
        SizedBox(
          height: 1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 25,
            itemBuilder: (context, index) {
              return Container(color: ThemeColor.lineGrayColor, height: 1, width: 10, margin: const EdgeInsets.symmetric(horizontal: 2),);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$143', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),),
                  const Text('/night'),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ThemeColor.purpleColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
                    child: Text(textButton, style: TextStyle(color: ThemeColor.superWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget itemServiceInRoom(String title, Color colorItem, IconData iconData) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorItem.withOpacity(0.3),
            borderRadius: BorderRadius.circular(13)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(iconData, color: colorItem, size: 20,),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 50,
          child: Text(title, style: TextStyle(fontSize: 10.sp), textAlign: TextAlign.center,)
        ),
      ],
    );
  }

  Widget itemInfoInHotels(IconData iconData, String data, String dataBehind, Color color) {
    return Row(
      children: [
        Icon(iconData, color: color,),
        SizedBox(
          width: 260.w,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: data,
                ),
                TextSpan(
                  text: dataBehind,
                  style: TextStyle(color: ThemeColor.sliverColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
