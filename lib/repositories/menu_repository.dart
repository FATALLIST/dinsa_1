// lib/repositories/menu_repository.dart

import 'package:flutter/foundation.dart';
import '../models/menu.dart';

class MenuRepository extends ChangeNotifier {
  final List<Menu> _menus = [];

  MenuRepository({List<Menu>? initialMenus}) {
    if (initialMenus != null) {
      _menus.addAll(initialMenus);
    }
  }

  /// Get all menus
  List<Menu> get menus => List.unmodifiable(_menus);

  /// Get menus for a specific child
  List<Menu> getByChild(int childId) {
    return _menus.where((m) => m.childId == childId).toList();
  }

  /// Add a new menu
  void addMenu(Menu menu) {
    _menus.add(menu);
    notifyListeners();
  }

  /// Update an existing menu
  void updateMenu(int id, Menu updatedMenu) {
    final idx = _menus.indexWhere((m) => m.id == id);
    if (idx != -1) {
      _menus[idx] = updatedMenu;
      notifyListeners();
    }
  }

  /// Delete a menu
  void deleteMenu(int id) {
    _menus.removeWhere((m) => m.id == id);
    notifyListeners();
  }

  /// Reset repository
  void reset(List<Menu> initialMenus) {
    _menus
      ..clear()
      ..addAll(initialMenus);
    notifyListeners();
  }
}
