// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'chat_history.g.dart';

@JsonSerializable()
class ChatHistory {
  ChatHistory({
    required this.id,
    required this.role,
    required this.msg,
    DateTime? sentAt,
  }) : sentAt = sentAt ?? DateTime.now();
  final String id;
  final String msg;
  final String role;
  final DateTime sentAt;

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}
