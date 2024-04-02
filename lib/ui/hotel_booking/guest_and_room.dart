import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';

import 'bloc/count_bloc.dart';

class GuestAndRoom extends StatefulWidget {
  const GuestAndRoom({Key? key}) : super(key: key);
  static const String routeName = '/guestAndRoom';

  @override
  State<GuestAndRoom> createState() => _GuestAndRoomState();
}

class _GuestAndRoomState extends State<GuestAndRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whiteColor,
      body: Column(
        children: [
          const AppbarCustom(
            textBelow: true,
            title: 'Add',
            subTitle: 'guest and room',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  BlocBuilder<CountBloc, CountState>(builder: (context, state) {
                    return itemInAddRom(
                      ThemeColor.orangeColor,
                      Icons.person,
                      'Guest',
                      context,
                      state.count,
                      () {
                        context.read<CountBloc>().add(CounterDecrement());
                      },
                      () {
                        context.read<CountBloc>().add(CounterIncrement());
                      },
                    );
                  }),


                  BlocBuilder<CountBloc, CountState>(builder: (context, state) {
                    return itemInAddRom(
                      ThemeColor.redFadeColor,
                      Icons.bed_sharp,
                      'Room',
                      context,
                      state.count2,
                          () {
                        context.read<CountBloc>().add(CounterDecrement2());
                      },
                          () {
                        context.read<CountBloc>().add(CounterIncrement2());
                      },
                    );
                  }),

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
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: ThemeColor.superWhiteColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemInAddRom(
      Color? colorData,
      IconData iconData,
      String? service,
      BuildContext context,
      int dataCount,
      VoidCallback eventRemove,
      VoidCallback eventAdd) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorData?.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      size: 18.sp,
                      color: colorData,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(service ?? ''),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ThemeColor.greenFadeColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                      onPressed: eventRemove,
                      icon: const Icon(
                        Icons.remove,
                        color: ThemeColor.superWhiteColor,
                      )),
                ),
              ),
            ),
            Text('$dataCount'),
            Expanded(
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ThemeColor.greenFadeColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                      onPressed: eventAdd,
                      icon: const Icon(
                        Icons.add,
                        color: ThemeColor.superWhiteColor,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
