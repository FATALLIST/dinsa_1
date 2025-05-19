// lib/ui/screens/admin/master/master_admin_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/user.dart';
import '../../../../repositories/user_repository.dart';
import '../../../../repositories/child_repository.dart';
import '../../../widgets/pagination.dart';

class MasterAdminScreen extends StatefulWidget {
  const MasterAdminScreen({super.key});

  @override
  State<MasterAdminScreen> createState() => _MasterAdminScreenState();
}

class _MasterAdminScreenState extends State<MasterAdminScreen> {
  int caregiverPage = 1;
  int childPage = 1;
  final int pageSize = 10;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final userRepo = context.watch<UserRepository>();
    final childRepo = context.watch<ChildRepository>();

    // Caregivers list
    final caregivers = userRepo.getByRole(Role.caregiver);
    final filteredCaregivers = searchQuery.isEmpty
        ? caregivers
        : caregivers.where((u) => u.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    final caregiverTotal = filteredCaregivers.length;
    final caregiverPages = (caregiverTotal / pageSize).ceil();
    final caregiverStart = (caregiverPage - 1) * pageSize;
    final caregiverEnd = (caregiverStart + pageSize).clamp(0, caregiverTotal);
    final pagedCaregivers = filteredCaregivers.sublist(caregiverStart, caregiverEnd);

    // Children list
    final children = childRepo.children;
    final filteredChildren = searchQuery.isEmpty
        ? children
        : children.where((c) => c.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    final childTotal = filteredChildren.length;
    final childPages = (childTotal / pageSize).ceil();
    final childStart = (childPage - 1) * pageSize;
    final childEnd = (childStart + pageSize).clamp(0, childTotal);
    final pagedChildren = filteredChildren.sublist(childStart, childEnd);

    return Scaffold(
      appBar: AppBar(title: const Text('Master Admin')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Cari (caregiver & anak)...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() {
                searchQuery = val;
                caregiverPage = 1;
                childPage = 1;
              }),
            ),
            const SizedBox(height: 16),
            Text('Daftar Caregiver', style: Theme.of(context).textTheme.titleLarge),
            ElevatedButton.icon(
              onPressed: () {
                // show add caregiver form
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Tambah Caregiver'),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: pagedCaregivers.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, idx) {
                  final user = pagedCaregivers[idx];
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(user.name),
                    subtitle: Text(user.email ?? ''),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // edit caregiver
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            userRepo.deleteUser(user.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Pagination(
              currentPage: caregiverPage,
              totalPages: caregiverPages,
              onPageChanged: (p) => setState(() => caregiverPage = p),
            ),
            const SizedBox(height: 24),
            Text('Daftar Anak', style: Theme.of(context).textTheme.titleLarge),
            ElevatedButton.icon(
              onPressed: () {
                // show add child form
              },
              icon: const Icon(Icons.child_care),
              label: const Text('Tambah Anak'),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: pagedChildren.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, idx) {
                  final child = pagedChildren[idx];
                  return ListTile(
                    leading: const Icon(Icons.child_care),
                    title: Text(child.name),
                    subtitle: Text('${child.ageMonths ?? 0} bulan'),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // edit child
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            childRepo.deleteChild(child.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Pagination(
              currentPage: childPage,
              totalPages: childPages,
              onPageChanged: (p) => setState(() => childPage = p),
            ),
          ],
        ),
      ),
    );
  }
}
