// lib/ui/screens/profile/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../services/auth_service.dart';
import '../../../repositories/child_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final childRepo = context.watch<ChildRepository>();
    final children = childRepo.children;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Nama Pengguna', // TODO: fetch from AuthService
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '0812-3456-7890', // TODO: fetch phone
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            const Text('Profil Anak', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: children.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, idx) {
                  final child = children[idx];
                  return ListTile(
                    leading: const Icon(Icons.child_care),
                    title: Text(child.name),
                    subtitle: Text('${child.ageMonths ?? 0} bulan'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => childRepo.deleteChild(child.id),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: show add child form
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah Anak'),
            ),
            const SizedBox(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () async {
                  await authService.logout();
                  context.go('/auth');
                },
                child: const Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Perkembangan'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Laporan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 4,
      ),
    );
  }
}
