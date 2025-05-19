// lib/models/growth.dart

import 'package:json_annotation/json_annotation.dart';

part 'growth.g.dart';

@JsonSerializable()
class Growth {
  final int id;
  final int childId;
  final double weight; // in kilograms
  final double height; // in centimeters
  final double headCircumference; // in centimeters
  final DateTime date;

  Growth({
    required this.id,
    required this.childId,
    required this.weight,
    required this.height,
    required this.headCircumference,
    required this.date,
  });

  factory Growth.fromJson(Map<String, dynamic> json) => _$GrowthFromJson(json);
  Map<String, dynamic> toJson() => _$GrowthToJson(this);
}
