// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final typeId = 3;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      carbs: (fields[0] as num).toInt(),
      netCarbs: (fields[1] as num).toInt(),
      calories: (fields[2] as num).toInt(),
      protein: (fields[3] as num).toInt(),
      fiber: (fields[4] as num).toInt(),
      totalFat: (fields[5] as num).toDouble(),
      totalSugar: (fields[6] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.carbs)
      ..writeByte(1)
      ..write(obj.netCarbs)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.protein)
      ..writeByte(4)
      ..write(obj.fiber)
      ..writeByte(5)
      ..write(obj.totalFat)
      ..writeByte(6)
      ..write(obj.totalSugar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
