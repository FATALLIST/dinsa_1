// lib/repositories/growth_repository.dart

import 'package:flutter/foundation.dart';
import '../models/growth.dart';

class GrowthRepository extends ChangeNotifier {
  final List<Growth> _growthData = [];

  GrowthRepository({List<Growth>? initialGrowth}) {
    if (initialGrowth != null) {
      _growthData.addAll(initialGrowth);
    }
  }

  /// Get all growth records
  List<Growth> get allGrowth => List.unmodifiable(_growthData);

  /// Get records for a specific child
  List<Growth> getByChild(int childId) {
    return _growthData.where((g) => g.childId == childId).toList();
  }

  /// Add new growth record
  void addGrowth(Growth record) {
    _growthData.add(record);
    notifyListeners();
  }

  /// Update growth record by id
  void updateGrowth(int id, Growth updated) {
    final idx = _growthData.indexWhere((g) => g.id == id);
    if (idx != -1) {
      _growthData[idx] = updated;
      notifyListeners();
    }
  }

  /// Delete growth record
  void deleteGrowth(int id) {
    _growthData.removeWhere((g) => g.id == id);
    notifyListeners();
  }

  /// Reset repository
  void reset(List<Growth> initialGrowth) {
    _growthData
      ..clear()
      ..addAll(initialGrowth);
    notifyListeners();
  }
}
