// lib/models/activity.dart

import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  final int id;
  final int childId;
  final String description;
  final DateTime dateTime;

  Activity({
    required this.id,
    required this.childId,
    required this.description,
    required this.dateTime,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
