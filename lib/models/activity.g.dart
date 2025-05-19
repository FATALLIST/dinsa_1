// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    id: json['id'] as int,
    childId: json['childId'] as int,
    description: json['description'] as String,
    dateTime: DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'description': instance.description,
      'dateTime': instance.dateTime.toIso8601String(),
    };
