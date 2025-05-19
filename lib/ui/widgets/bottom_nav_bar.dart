// lib/ui/widgets/bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex;
    switch (location) {
      case '/activities':
        currentIndex = 0;
        break;
      case '/development':
        currentIndex = 1;
        break;
      case '/home':
        currentIndex = 2;
        break;
      case '/reports':
        currentIndex = 3;
        break;
      case '/profile':
        currentIndex = 4;
        break;
      default:
        currentIndex = 2;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (idx) {
        const paths = ['/activities', '/development', '/home', '/reports', '/profile'];
        context.go(paths[idx]);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Aktivitas'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Perkembangan'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Laporan'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
