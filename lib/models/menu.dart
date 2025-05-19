// lib/models/menu.dart

import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final int id;
  final int childId;
  final String name;
  final DateTime date;

  Menu({
    required this.id,
    required this.childId,
    required this.name,
    required this.date,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
