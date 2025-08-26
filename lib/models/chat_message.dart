import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage({
    required this.role,
    required this.msg,
    DateTime? sentAt,
  }) : sentAt = sentAt ?? DateTime.now();

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  final String msg;
  final String role;
  final DateTime sentAt;
}
