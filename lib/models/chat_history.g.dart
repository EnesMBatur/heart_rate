// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) => ChatHistory(
  id: json['id'] as String,
  role: json['role'] as String,
  msg: json['msg'] as String,
  sentAt: json['sentAt'] == null
      ? null
      : DateTime.parse(json['sentAt'] as String),
);

// ignore: unused_element
Map<String, dynamic> _$ChatHistoryToJson(ChatHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
      'role': instance.role,
      'sentAt': instance.sentAt.toIso8601String(),
    };
