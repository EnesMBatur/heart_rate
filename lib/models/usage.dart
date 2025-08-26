import 'package:json_annotation/json_annotation.dart';

part 'usage.g.dart';

@JsonSerializable(createToJson: false)
class Usage {
  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;
}
