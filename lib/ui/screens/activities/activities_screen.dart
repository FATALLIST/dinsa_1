// lib/ui/screens/activities/activities_screen.dart

import 'package:flutter/material.dart';
import 'activity_calendar.dart';
import 'activity_list.dart';
import '../../widgets/pagination.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int currentPage = 1;
  final int pageSize = 10;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ActivityCalendar(),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Cari kegiatan...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() => searchQuery = val),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ActivityList(
                page: currentPage,
                pageSize: pageSize,
                searchQuery: searchQuery,
              ),
            ),
            Pagination(
              currentPage: currentPage,
              onPageChanged: (p) => setState(() => currentPage = p),
            ),
          ],
        ),
      ),
    );
  }
}





