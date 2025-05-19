// lib/repositories/user_repository.dart

import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserRepository extends ChangeNotifier {
  final List<User> _users = [];

  UserRepository({List<User>? initialUsers}) {
    if (initialUsers != null) {
      _users.addAll(initialUsers);
    }
  }

  List<User> get users => List.unmodifiable(_users);

  /// Get users by role name
  List<User> getByRole(Role role) {
    return _users.where((u) => u.role == role).toList();
  }

  /// Add user
  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  /// Update user by id
  void updateUser(int id, User updated) {
    final idx = _users.indexWhere((u) => u.id == id);
    if (idx != -1) {
      _users[idx] = updated;
      notifyListeners();
    }
  }

  /// Delete user by id
  void deleteUser(int id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }

  /// Search users by name
  List<User> search(String query) {
    return _users
        .where((u) => u.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Pagination for users
  List<User> paginate(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    if (start >= _users.length) return [];
    return _users.skip(start).take(pageSize).toList();
  }

  /// Reset repository
  void reset(List<User> initialUsers) {
    _users
      ..clear()
      ..addAll(initialUsers);
    notifyListeners();
  }
}
