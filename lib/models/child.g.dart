// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) {
  return Child(
    id: json['id'] as int,
    name: json['name'] as String,
    birthdate: DateTime.parse(json['birthdate'] as String),
    ageMonths: json['ageMonths'] as int?,
  );
}

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthdate': instance.birthdate.toIso8601String(),
      'ageMonths': instance.ageMonths,
    };
