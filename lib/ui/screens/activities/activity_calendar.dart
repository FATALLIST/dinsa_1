// lib/ui/screens/activities/activity_calendar.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivityCalendar extends StatelessWidget {
  const ActivityCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          focusedDay: DateTime.now(),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          headerStyle: const HeaderStyle(formatButtonVisible: false),
        ),
      ),
    );
  }
}