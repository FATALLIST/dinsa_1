// lib/ui/widgets/growth_chart.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../../repositories/growth_repository.dart';

class GrowthChart extends StatelessWidget {
  final int childId;
  const GrowthChart({super.key, required this.childId});

  @override
  Widget build(BuildContext context) {
    final growthRepo = context.watch<GrowthRepository>();
    final data = growthRepo.getByChild(childId);
    if (data.isEmpty) {
      return const Center(child: Text('Tidak ada data pertumbuhan'));  
    }

    // Map data to spots
    final spots = data
        .map((g) => FlSpot(
              g.date.millisecondsSinceEpoch.toDouble(),
              g.weight,
            ))
        .toList();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                    return SideTitleWidget(
                      fitInside: SideTitleFitInsideData(
                        enabled: true,
                        axisPosition: 0,
                        distanceFromEdge: 0,
                        parentAxisSize: 0,
                      ),
                      meta: meta,
                      child: Text('${date.day}/${date.month}'),
                    );
                  },
                  reservedSize: 40,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                dotData: FlDotData(show: true),
                barWidth: 3,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
