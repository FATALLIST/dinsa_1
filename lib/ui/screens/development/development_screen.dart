// lib/ui/screens/development/development_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../repositories/child_repository.dart';
import '../../../models/child.dart';
import '../../widgets/growth_chart.dart';
import '../../widgets/growth_table.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({super.key});

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  Child? _selectedChild;

  @override
  Widget build(BuildContext context) {
    final childRepo = context.watch<ChildRepository>();
    final children = childRepo.children;
    if (_selectedChild == null && children.isNotEmpty) {
      _selectedChild = children.first;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Perkembangan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<Child>(
              value: _selectedChild,
              items: children.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text(c.name),
                );
              }).toList(),
              onChanged: (c) => setState(() => _selectedChild = c),
            ),
            const SizedBox(height: 16),
            if (_selectedChild != null) ...[
              Expanded(
                child: GrowthChart(childId: _selectedChild!.id),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GrowthTable(childId: _selectedChild!.id),
              ),
            ] else ...[
              const Center(child: Text('Belum ada data anak')),
            ],
          ],
        ),
      ),
    );
  }
}
