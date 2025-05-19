// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    id: json['id'] as int,
    childId: json['childId'] as int,
    name: json['name'] as String,
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
    };
