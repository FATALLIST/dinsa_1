// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Growth _$GrowthFromJson(Map<String, dynamic> json) {
  return Growth(
    id: json['id'] as int,
    childId: json['childId'] as int,
    weight: (json['weight'] as num).toDouble(),
    height: (json['height'] as num).toDouble(),
    headCircumference: (json['headCircumference'] as num).toDouble(),
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$GrowthToJson(Growth instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'weight': instance.weight,
      'height': instance.height,
      'headCircumference': instance.headCircumference,
      'date': instance.date.toIso8601String(),
    };
