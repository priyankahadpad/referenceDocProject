import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SfCalResource extends StatefulWidget {
  const SfCalResource({super.key});

  @override
  State<SfCalResource> createState() => _SfCalResourceState();
}

CalendarController? _calendarController;
List<Appointment>? _appointments;
List<CalendarResource> _employeeCollection = <CalendarResource>[];

class _SfCalResourceState extends State<SfCalResource> {
   @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _appointments = <Appointment>[
      Appointment(
          startTime: DateTime(2024, 6, 26, 9, 0),
          endTime: DateTime(2024, 6, 26, 10, 30),
          subject: 'Development Meeting',
          resourceIds: [4],
          color: Color(0XFFFC571D)),
      Appointment(
          startTime: DateTime(2024, 6, 26, 18, 0),
          endTime: DateTime(2024, 6, 26, 18, 30),
          subject: 'GeneralMeeting',
          resourceIds: [2],
          color: Color(0xFF8B1FA9)),
      Appointment(
        startTime: DateTime(2024, 6, 28, 9, 0),
        endTime: DateTime(2024, 6, 28, 10, 30),
        subject: 'Lunch',
        resourceIds: [1],
      ),
      Appointment(
        startTime: DateTime(2024, 6, 25, 10, 0),
        endTime: DateTime(2024, 6, 25, 10, 30),
        subject: 'Meeting',
        resourceIds: [2],
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Match day',
        resourceIds: [3],
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Muharram/Ashura',
        resourceIds: [3],
      ),
    ];
    _employeeCollection = <CalendarResource>[
      CalendarResource(
        id: 1,
        image: AssetImage("assets/images/png/cimg1.png"),
        displayName: 'Kaylly Vaccaro',
        color: Colors.transparent,
      ),
      CalendarResource(
        id: 2,
        image: AssetImage("assets/images/png/cimg2.png"),
        displayName: 'Ryan Dorwart',
        color: Colors.transparent,
      ),
      CalendarResource(
        id: 3,
        image: AssetImage("assets/images/png/cimg3.png"),
        displayName: 'Ahmad Rhiel',
        color: Colors.transparent,
      ),
      CalendarResource(
        id: 4,
        image: AssetImage("assets/images/png/cimg3.png"),
        displayName: 'Ahmad Rhiel',
        color: Colors.transparent,
      ),
      CalendarResource(
        id: 5,
        image: AssetImage("assets/images/png/Ellipse 52.png"),
        displayName: 'Ahmad Rhiel',
        color: Colors.transparent,
      ),
      CalendarResource(
        id: 6,
        image: AssetImage("assets/images/png/Ellipse 48.png"),
        displayName: 'Ahmad Rhiel',
        color: Colors.transparent,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [SfCalendar(
                      view: CalendarView.timelineMonth,
                      appointmentTextStyle: TextStyle(color: Colors.white),
                      headerStyle: CalendarHeaderStyle(
                          textStyle: TextStyle(
                        color: Colors.blue,
                      )),
                      // blackoutDatesTextStyle: TextStyle(color: Colors.white),

                      weekNumberStyle: WeekNumberStyle(
                          textStyle: TextStyle(color: Colors.white)),
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
                      controller: _calendarController,
                      showNavigationArrow: true,
                      allowViewNavigation: true,
                      // showDatePickerButton: true,
                      monthViewSettings: MonthViewSettings(
                        navigationDirection:
                            MonthNavigationDirection.horizontal,
                      ),
                      allowDragAndDrop: true,
                      allowedViews: [
                        // CalendarView.month,
                        // CalendarView.day,
                        // CalendarView.schedule,
                        CalendarView.timelineMonth,
                        CalendarView.timelineDay
                      ],
                      viewNavigationMode: ViewNavigationMode.snap,
                      showCurrentTimeIndicator: true,
                      dataSource: MeetingDataSource(
                          _appointments!, _employeeCollection),
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
                                  color:
                                      Colors.white), // Set text color to white
                            ),
                          ),
                        );
                      },
                      resourceViewSettings: ResourceViewSettings(
                        displayNameTextStyle:
                            TextStyle(color: Colors.white, fontSize: 10),
                        showAvatar: true,
                      ),

                      // selectionDecoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.r)),
                      appointmentBuilder: (context, details) {
                        final Appointment appointment =
                            details.appointments.first;

                        return Container(
                          decoration: BoxDecoration(
                            color:
                                details.appointments.first.color ?? Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment.subject,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),]),);
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
      List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}
