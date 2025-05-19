// lib/repositories/activity_repository.dart

import 'package:flutter/foundation.dart';
import '../models/activity.dart';

class ActivityRepository extends ChangeNotifier {
  final List<Activity> _activities = [];

  ActivityRepository({List<Activity>? initialActivities}) {
    if (initialActivities != null) {
      _activities.addAll(initialActivities);
    }
  }

  /// Get all activities (unmodifiable)
  List<Activity> get activities => List.unmodifiable(_activities);

  /// Find activities for a specific child
  List<Activity> getByChild(int childId) {
    return _activities.where((a) => a.childId == childId).toList();
  }

  /// Add a new activity
  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }

  /// Update existing activity
  void updateActivity(int id, Activity updatedActivity) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index] = updatedActivity;
      notifyListeners();
    }
  }

  /// Delete an activity
  void deleteActivity(int id) {
    _activities.removeWhere((a) => a.id == id);
    notifyListeners();
  }

  /// Search activities by description
  List<Activity> search(String query) {
    return _activities
        .where((a) => a.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Pagination for activities list
  List<Activity> paginate(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    if (start >= _activities.length) return [];
    return _activities.skip(start).take(pageSize).toList();
  }

  /// Reset repository to initial data
  void reset(List<Activity> initialActivities) {
    _activities
      ..clear()
      ..addAll(initialActivities);
    notifyListeners();
  }
}
