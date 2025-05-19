// lib/models/user.dart

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Enum untuk role user
enum Role { master, caregiver, parent, guest }

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String? email;
  final String? provider;
  final String? providerId;
  final Role role;

  User({
    required this.id,
    required this.name,
    this.email,
    this.provider,
    this.providerId,
    required this.role,
  });

  /// JSON serialization
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
