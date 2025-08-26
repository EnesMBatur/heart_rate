import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: 5)
class Message {
  Message({this.role, this.content});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  String? role;
  String? content;
}
