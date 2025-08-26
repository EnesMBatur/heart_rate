import 'package:heart_rate/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'choices.g.dart';

@JsonSerializable(createToJson: false)
class Choices {
  Choices({this.message, this.finishReason, this.index});

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);
  Message? message;
  String? finishReason;
  int? index;
}
