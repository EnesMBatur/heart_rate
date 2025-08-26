// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
  message: json['message'] == null
      ? null
      : Message.fromJson(json['message'] as Map<String, dynamic>),
  finishReason: json['finishReason'] as String?,
  index: (json['index'] as num?)?.toInt(),
);
