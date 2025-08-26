import 'package:heart_rate/models/choices.dart';
import 'package:heart_rate/models/usage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable(createToJson: false)
class Chat {
  Chat({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choices>? choices;
}
