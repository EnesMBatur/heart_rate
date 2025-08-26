// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
  id: json['id'] as String?,
  object: json['object'] as String?,
  created: (json['created'] as num?)?.toInt(),
  model: json['model'] as String?,
  usage: json['usage'] == null
      ? null
      : Usage.fromJson(json['usage'] as Map<String, dynamic>),
  choices: (json['choices'] as List<dynamic>?)
      ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
      .toList(),
);
