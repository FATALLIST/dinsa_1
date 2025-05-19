// lib/repositories/media_repository.dart

import 'package:flutter/foundation.dart';
import '../models/media.dart';

class MediaRepository extends ChangeNotifier {
  final List<Media> _mediaList = [];

  MediaRepository({List<Media>? initialMedia}) {
    if (initialMedia != null) {
      _mediaList.addAll(initialMedia);
    }
  }

  /// Get all media
  List<Media> get allMedia => List.unmodifiable(_mediaList);

  /// Get media for a specific child
  List<Media> getByChild(int childId) {
    return _mediaList.where((m) => m.childId == childId).toList();
  }

  /// Add new media
  void addMedia(Media media) {
    _mediaList.add(media);
    notifyListeners();
  }

  /// Update media record by id
  void updateMedia(int id, Media updated) {
    final idx = _mediaList.indexWhere((m) => m.id == id);
    if (idx != -1) {
      _mediaList[idx] = updated;
      notifyListeners();
    }
  }

  /// Delete media by id
  void deleteMedia(int id) {
    _mediaList.removeWhere((m) => m.id == id);
    notifyListeners();
  }

  /// Reset repository
  void reset(List<Media> initialMedia) {
    _mediaList
      ..clear()
      ..addAll(initialMedia);
    notifyListeners();
  }
}
