import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travo_app/theme/theme_color.dart';
import 'package:travo_app/ui/item_widget/appbar_custom.dart';
import 'package:travo_app/ui/item_widget/button_custom.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({Key? key}) : super(key: key);
  static const String routeName = '/selecDateScreen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime today = DateTime.now();
  List<DateTime> selectedDates = [];
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarCustom(
            title: 'Select date',
          ),
          Text('${startDate?.year} - ${startDate?.month} - ${startDate?.day}'),
          Text('${endDate?.year} - ${endDate?.month} - ${endDate?.day}'),

          TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            selectedDayPredicate: (DateTime day) {
              return day == startDate || day == endDate;
            },
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                if (startDate == null || endDate != null) {
                  startDate = selectedDay;
                  endDate = null;
                } else {
                  if (selectedDay.isBefore(startDate!)) {
                    endDate = startDate;
                    startDate = selectedDay;
                  } else {
                    endDate = selectedDay;
                  }
                }
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(color: ThemeColor.orangeColor.withOpacity(0.5)),
              selectedDecoration: const BoxDecoration(color: ThemeColor.orangeColor),
              rangeStartDecoration: BoxDecoration(color: ThemeColor.orangeColor.withOpacity(0.3)),
              rangeEndDecoration: BoxDecoration(color: ThemeColor.orangeColor.withOpacity(0.3)),
              rangeHighlightColor: ThemeColor.orangeColor.withOpacity(0.3),
            ),
            rangeEndDay: endDate,
            rangeStartDay: startDate,
          ),
          SizedBox(height: 15.h),
          ButtonCustom(
            titleButtonText: 'Select',
            colorButton: ThemeColor.purpleColor,
            titleButtonColor: ThemeColor.superWhiteColor,
            onTap: () {
              Navigator.pop(context, {'startDate': startDate, 'endDate': endDate});
            },
          ),
          SizedBox(height: 15.h),
          ButtonCustom(
            titleButtonText: 'Cancel',
            colorButton: ThemeColor.purpleColor.withOpacity(0.2),
            titleButtonColor: ThemeColor.purpleColor,
            onTap: () {
              Navigator.pop(context);
            },
          )

        ],
      ),
    );
  }
}
