import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalendarDatePicker extends StatefulWidget {
  const CalendarDatePicker({super.key});

  @override
  State<CalendarDatePicker> createState() => _CalendarDatePickerState();
}

class _CalendarDatePickerState extends State<CalendarDatePicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.range,
            weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            selectedYearTextStyle: TextStyle(color: Colors.white),
            yearTextStyle: TextStyle(color: Colors.white),
            selectedDayHighlightColor: Color(0xFFD90B2E),
            controlsTextStyle: TextStyle(color: Colors.white),
            dayTextStyle: TextStyle(color: Colors.white),
            monthTextStyle: TextStyle(color: Colors.white),
            weekdayLabelTextStyle: TextStyle(color: Colors.white),
            nextMonthIcon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            lastMonthIcon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          value: [selectedDate],
        ),
      ]),
    );
  }
}
