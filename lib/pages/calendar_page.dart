import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/lesson/lesson_bloc.dart';
import 'package:tobeto_app/logic/blocs/lesson/lesson_event.dart';
import 'package:tobeto_app/logic/blocs/lesson/lesson_state.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/drawer.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.lessonList});
  final List<String> lessonList;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state is LessonInitial) {
          context
              .read<LessonBloc>()
              .add(FetchUserLessons(userLessonList: widget.lessonList));
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LessonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LessonError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is LessonLoaded) {
          return Scaffold(
            appBar: CustomAppBarWidget(brightness: brightness),
            drawer: const MyDrawer(),
            body: SfCalendar(
              view: CalendarView.week,
              firstDayOfWeek: 1, //Pazartesiden başlaması için
              dataSource:
                  MeetingDataSource(getAppointments(state.educationList)),
            ),
          );
        }
        return const Text(LessonConstants.lessonsNotFound);
      },
    );
  }
}

List<Appointment> getAppointments(List<Education> educationList) {
  //TODO: Colorlar constants olarak alınacak
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
