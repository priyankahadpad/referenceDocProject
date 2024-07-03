import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SfCalender extends StatefulWidget {
  const SfCalender({super.key});

  @override
  State<SfCalender> createState() => _SfCalenderState();
}

CalendarController? CalController;
List<Appointment>? _appointments;

class _SfCalenderState extends State<SfCalender> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CalController = CalendarController();

    _appointments = <Appointment>[
      Appointment(
          startTime: DateTime(2024, 6, 26, 9, 0),
          endTime: DateTime(2024, 6, 26, 10, 30),
          subject: 'Development Meeting',
          color: Color(0XFFFC571D)),
      Appointment(
          startTime: DateTime(2024, 6, 26, 18, 0),
          endTime: DateTime(2024, 6, 26, 18, 30),
          subject: 'GeneralMeeting',
          color: Color(0xFF8B1FA9)),
      Appointment(
        startTime: DateTime(2024, 6, 28, 9, 0),
        endTime: DateTime(2024, 6, 28, 10, 30),
        subject: 'Lunch',
      ),
      Appointment(
        startTime: DateTime(2024, 6, 25, 10, 0),
        endTime: DateTime(2024, 6, 25, 10, 30),
        subject: 'Meeting',
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Match day',
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Muharram/Ashura',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GlassmorphicContainer(
          width: double.infinity,
          height: 500,
          borderRadius: 3,
          border: 0,
          blur: 0.6,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.1),
                Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff3A3A3A),
              Color(0xFF3A3A3A),
            ],
          ),
          child: SfCalendar(
              view: CalendarView.month,
              appointmentTextStyle: TextStyle(color: Colors.white),
              headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                color: Colors.blue,
              )),
              // blackoutDatesTextStyle: TextStyle(color: Colors.white),

              weekNumberStyle:
                  WeekNumberStyle(textStyle: TextStyle(color: Colors.white)),
              viewHeaderStyle: ViewHeaderStyle(
                // backgroundColor: Colors.amber,
                dateTextStyle: TextStyle(color: Colors.white),
                dayTextStyle: TextStyle(
                  color: Color(0xFFD90B2E),
                ),
              ),
              // blackoutDatesTextStyle: TextStyle(color: Colors.white),
              // selectionDecoration: BoxDecoration(color: Colors.amber),
              backgroundColor: Colors.transparent,
              // firstDayOfWeek: 3,
              cellBorderColor: Colors.white,
              todayHighlightColor: Color(0xFFD90B2E),
              todayTextStyle: const TextStyle(color: Colors.white),
              controller: CalController,
              showNavigationArrow: true,
              // allowViewNavigation: true,
              allowDragAndDrop: true,
              // showDatePickerButton: true,
              monthViewSettings: MonthViewSettings(
                navigationDirection: MonthNavigationDirection.horizontal,
              ),
              allowedViews: [
                CalendarView.month,
                // CalendarView.day,
                CalendarView.schedule,
              ],
              viewNavigationMode: ViewNavigationMode.snap,
              showCurrentTimeIndicator: true,
              dataSource: MeetingDataSource(_appointments!),
              onTap: calendarTapped,
              timeSlotViewSettings: TimeSlotViewSettings(
                // minimumAppointmentDuration: Duration(hours: 5),
                timeTextStyle: TextStyle(
                  color: Colors.white,
                ),
                timelineAppointmentHeight: 60,
                // timeIntervalWidth: 100,

                // timeIntervalHeight: 50,
                timeIntervalWidth: 70,
              ),
              monthCellBuilder: (context, details) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      details.date.day.toString(),
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  ),
                );
              },
              resourceViewSettings: ResourceViewSettings(
                displayNameTextStyle:
                    TextStyle(color: Colors.white, fontSize: 10),
                showAvatar: true,
              ),
              // scheduleViewSettings: ScheduleViewSettings(
              //     appointmentTextStyle: TextStyle(color: Colors.red)),

              scheduleViewSettings: ScheduleViewSettings(
                  placeholderTextStyle: TextStyle(color: Colors.white),
                  dayHeaderSettings: DayHeaderSettings(
                    dateTextStyle: TextStyle(color: Colors.white),
                    dayTextStyle: TextStyle(color: Colors.white),
                  )),
              // scheduleViewMonthHeaderBuilder: (context, details) {
              //   return Container(
              //     height: 30,
              //     width: 30,
              //     color: Colors.amber,
              //   );
              // },
              appointmentBuilder: (context, details) {
                final Appointment appointment = details.appointments.first;

                return Container(
                  decoration: BoxDecoration(
                    color: details.appointments.first.color ?? Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.subject,
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      Appointment appointment = details.appointments![0];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Event Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Event: ${appointment.subject}'),
                Text('From: ${appointment.startTime}'),
                Text('To: ${appointment.endTime}'),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(
    List<Appointment> source,
  ) {
    appointments = source;
  }
}
