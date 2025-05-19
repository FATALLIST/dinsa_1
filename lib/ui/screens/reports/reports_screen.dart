// lib/ui/screens/reports/reports_screen.dart

import 'package:dinsa_1/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laporan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                Image.asset('assets/images/coming_soon.png', width: 120),
                const SizedBox(height: 24),
                const Text(
                  'Fitur Laporan masih dalam perbaikan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go('/activities'),
                  child: const Text('Cek Aktivitas'),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
