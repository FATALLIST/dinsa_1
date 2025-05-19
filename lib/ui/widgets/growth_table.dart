// lib/ui/widgets/growth_table.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../models/growth.dart';
import '../../repositories/growth_repository.dart';

class GrowthTable extends StatelessWidget {
  final int childId;
  const GrowthTable({super.key, required this.childId});

  @override
  Widget build(BuildContext context) {
    final growthRepo = context.watch<GrowthRepository>();
    final data = growthRepo.getByChild(childId);

    if (data.isEmpty) {
      return const Center(child: Text('Tidak ada data pertumbuhan'));  
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Berat (kg)')),
            DataColumn(label: Text('Tinggi (cm)')),
            DataColumn(label: Text('Lingkar Kepala (cm)')),
          ],
          rows: data.map((g) {
            final dateStr = g.date.toLocal().toIso8601String().split('T').first;
            return DataRow(cells: [
              DataCell(Text(dateStr)),
              DataCell(Text(g.weight.toStringAsFixed(1))),
              DataCell(Text(g.height.toStringAsFixed(1))),
              DataCell(Text(g.headCircumference.toStringAsFixed(1))),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}