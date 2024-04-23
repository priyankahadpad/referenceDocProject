import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// syncfusion_flutter_calendar: ^24.2.3

Widget sfcalender(){
  return Container(
                          width: 360,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                color: Color.fromRGBO(206, 206, 206, 0.25),
                              )
                            ],
                          ),
                          child: SfCalendar(
                            selectionDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF4AB1FB),
                              ),
                            ),
                            maxDate: DateTime.now(),
                            appointmentBuilder: null,
                            view: CalendarView.month,
                            firstDayOfWeek: 1,
                            cellBorderColor: Colors.white,
                            todayHighlightColor: Color(0xFF4AB1FB),
                            todayTextStyle:
                                const TextStyle(color: Colors.black),
                            // controller: _calendarController,
                            showNavigationArrow: true,
                            // allowViewNavigation: true,
                            monthViewSettings: const MonthViewSettings(),
                            // timeSlotViewSettings:
                            //     const TimeSlotViewSettings(
                            //   minimumAppointmentDuration:
                            //       Duration(minutes: 60),
                            // ),
                            onTap: (CalendarTapDetails details) {
                              // Handle calendar tap event

                              // setState(() {});
                              // selectedDate = details.date!;
                            
                              // GetHomeAPI().getHomeAPI(
                              //   DateFormat('yyyy-MM-dd')
                              //       .format(selectedDate),
                              //   streamController: datelistController,
                              // );
                              // isCalendarVisible = false;
                              // print("Selected Date: $selectedDate");
                            },
                          ),
                        );
}