import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_event.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_state.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    List<String> lessonList = [
      "#12ec5",
      "#64806",
      "#90c6a",
      "#a743c",
      "#abdb0"
    ];
    Brightness brightness = Theme.of(context).brightness;

    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state is LessonInitial) {
          context
              .read<LessonBloc>()
              .add(FetchUserLessons(userLessonList: lessonList));
          return const Center(
            child: Text("İstek atılıyor.."),
          );
        }

        if (state is LessonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LessonError) {
          return const Center(
            child: Text("İstek hatalı.."),
          );
        }
        if (state is LessonLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(getLogo(brightness), width: 125),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
            drawer: const MyDrawer(),
            body: SfCalendar(
              view: CalendarView.week,
              firstDayOfWeek: 1, //Pazartesiden başlaması için
              dataSource:
                  MeetingDataSource(getAppointments(state.educationList)),
            ),
          );
        }
        return const Text("No event found.");
      },
    );
  }
}

List<Appointment> getAppointments(List<Education> educationList) {
  List<Color?> colors = [
    Colors.deepPurple[200],
    Colors.deepPurple[300],
    Colors.deepPurple[500],
    Colors.deepPurpleAccent[100],
  ];

  List<Appointment> appointments = [];

  for (Education education in educationList) {
    Appointment appointment = Appointment(
      startTime: education.startDate,
      endTime: education.endDate,
      subject: education.title,
      color: colors[Random().nextInt(colors.length)]!,
    );

    appointments.add(appointment);
  }

  return appointments;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
