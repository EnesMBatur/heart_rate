import 'package:hive_ce/hive.dart';

part 'nutrition.g.dart';

@HiveType(typeId: 3)
class Nutrition {
  @HiveField(0)
  final int carbs;
  @HiveField(1)
  final int netCarbs;
  @HiveField(2)
  final int calories;
  @HiveField(3)
  final int protein;
  @HiveField(4)
  final int fiber;
  @HiveField(5)
  final double totalFat;
  @HiveField(6)
  final double totalSugar;

  Nutrition({
    required this.carbs,
    required this.netCarbs,
    required this.calories,
    required this.protein,
    required this.fiber,
    required this.totalFat,
    required this.totalSugar,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      carbs: json['carbs'],
      netCarbs: json['netCarbs'],
      calories: json['calories'],
      protein: json['protein'],
      fiber: json['fiber'],
      totalFat: json['totalFat'],
      totalSugar: json['totalSugar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carbs': carbs,
      'netCarbs': netCarbs,
      'calories': calories,
      'protein': protein,
      'fiber': fiber,
      'totalFat': totalFat,
      'totalSugar': totalSugar,
    };
  }
}
