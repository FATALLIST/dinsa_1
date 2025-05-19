// lib/models/media.dart

import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  final int id;
  final int childId;
  final String url;
  final MediaType type;
  final int createdBy;
  final DateTime createdAt;

  Media({
    required this.id,
    required this.childId,
    required this.url,
    required this.type,
    required this.createdBy,
    required this.createdAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

/// Tipe media: image atau video
enum MediaType { image, video }
