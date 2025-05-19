// lib/ui/screens/admin/caregiver_admin_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../repositories/user_repository.dart';
import '../../../../models/user.dart';
import '../../../widgets/pagination.dart';

class CaregiverAdminScreen extends StatefulWidget {
  const CaregiverAdminScreen({super.key});

  @override
  State<CaregiverAdminScreen> createState() => _CaregiverAdminScreenState();
}

class _CaregiverAdminScreenState extends State<CaregiverAdminScreen> {
  int currentPage = 1;
  final int pageSize = 10;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<UserRepository>();
    final caregivers = repo.getByRole('caregiver' as Role);
    final filtered = searchQuery.isEmpty
        ? caregivers
        : caregivers.where((u) => u.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    final totalPages = (filtered.length / pageSize).ceil();
    final start = (currentPage - 1) * pageSize;
    final end = (start + pageSize).clamp(0, filtered.length);
    final paged = filtered.sublist(start, end);

    return Scaffold(
      appBar: AppBar(title: const Text('Data Caregiver')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add caregiver logic (form dialog)
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Cari caregiver...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() {
                searchQuery = val;
                currentPage = 1;
              }),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: paged.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, idx) {
                  final caregiver = paged[idx];
                  return ListTile(
                    title: Text(caregiver.name),
                    subtitle: Text(caregiver.email ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        repo.deleteUser(caregiver.id);
                      },
                    ),
                  );
                },
              ),
            ),
            Pagination(
              currentPage: currentPage,
              totalPages: totalPages,
              onPageChanged: (p) => setState(() => currentPage = p),
            ),
          ],
        ),
      ),
    );
  }
}
