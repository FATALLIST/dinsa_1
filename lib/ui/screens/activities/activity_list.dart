// lib/ui/screens/activities/activity_list.dart

import 'package:flutter/material.dart';
import '../../../repositories/activity_repository.dart';
import 'package:provider/provider.dart';

class ActivityList extends StatelessWidget {
  final int page;
  final int pageSize;
  final String searchQuery;

  const ActivityList({
    super.key,
    required this.page,
    required this.pageSize,
    this.searchQuery = '',
  });

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<ActivityRepository>();
    // ignore: unused_local_variable
    var items = repo.activities;
    if (searchQuery.isNotEmpty) {
      items = repo.search(searchQuery);
    }
    final paged = repo.paginate(page, pageSize);

    if (paged.isEmpty) {
      return const Center(child: Text('Tidak ada kegiatan.'));
    }

    return ListView.separated(
      itemCount: paged.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, idx) {
        final act = paged[idx];
        return ListTile(
          title: Text(act.description),
          subtitle: Text(act.dateTime.toLocal().toString()),
          leading: const Icon(Icons.event),
        );
      },
    );
  }
}
