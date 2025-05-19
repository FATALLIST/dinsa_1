
// lib/models/media.g.dart

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    id: json['id'] as int,
    childId: json['childId'] as int,
    url: json['url'] as String,
    type: _$enumDecode(_$MediaTypeEnumMap, json['type']),
    createdBy: json['createdBy'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'url': instance.url,
      'type': _$MediaTypeEnumMap[instance.type],
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };

K _$enumDecode<K, V>(Map<K, V> enumValues, Object? source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: ' 
        '\${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '\`$source\` is not one of the supported values: ' 
              '\${enumValues.values.join(', ')}'))
      .key;
}

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};
