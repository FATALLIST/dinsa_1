// lib/models/child.dart

import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  final int id;
  final String name;
  final DateTime birthdate;
  final int? ageMonths;

  Child({
    required this.id,
    required this.name,
    required this.birthdate,
    this.ageMonths,
  });

  /// JSON serialization
  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
  Map<String, dynamic> toJson() => _$ChildToJson(this);
}
