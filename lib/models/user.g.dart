// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String?,
    provider: json['provider'] as String?,
    providerId: json['providerId'] as String?,
    role: _$enumDecode(_$RoleEnumMap, json['role']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'provider': instance.provider,
      'providerId': instance.providerId,
      'role': _$RoleEnumMap[instance.role],
    };

K _$enumDecode<K, V>(Map<K, V> enumValues, Object? source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$RoleEnumMap = {
  Role.master: 'master',
  Role.caregiver: 'caregiver',
  Role.parent: 'parent',
  Role.guest: 'guest',
};
