import 'package:hive_ce/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 2)
class Ingredient {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double? amount;
  @HiveField(2)
  final String? unit;
  @HiveField(3)
  final String? icon;

  Ingredient({required this.name, this.amount, this.unit, this.icon});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      amount: json['amount'].toDouble(),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'amount': amount, 'unit': unit};
  }
}
