// lib/repositories/child_repository.dart

import 'package:flutter/foundation.dart';
import '../models/child.dart';

class ChildRepository extends ChangeNotifier {
  final List<Child> _children = [];

  ChildRepository({List<Child>? initialChildren}) {
    if (initialChildren != null) {
      _children.addAll(initialChildren);
    }
  }

  /// Get all children (unmodifiable)
  List<Child> get children => List.unmodifiable(_children);

  /// Find a child by ID
  Child? getById(int id) {
    try {
      return _children.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Add a new child
  void addChild(Child child) {
    _children.add(child);
    notifyListeners();
  }

  /// Update existing child
  void updateChild(int id, Child updatedChild) {
    final index = _children.indexWhere((c) => c.id == id);
    if (index != -1) {
      _children[index] = updatedChild;
      notifyListeners();
    }
  }

  /// Delete a child
  void deleteChild(int id) {
    _children.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  /// Search children by name (case-insensitive)
  List<Child> search(String query) {
    return _children
        .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Pagination for children list
  List<Child> paginate(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    if (start >= _children.length) return [];
    return _children.skip(start).take(pageSize).toList();
  }

  /// Reset repository to initial data
  void reset(List<Child> initialChildren) {
    _children
      ..clear()
      ..addAll(initialChildren);
    notifyListeners();
  }
}
