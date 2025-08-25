// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: (fields[0] as num).toInt(),
      title: fields[1] as String,
      imgUrl: fields[10] as String,
      servings: (fields[2] as num).toInt(),
      info: fields[3] as String,
      gi: (fields[11] as num).toDouble(),
      gl: (fields[12] as num).toDouble(),
      ingredients: (fields[4] as List).cast<Ingredient>(),
      instructions: (fields[5] as List).cast<String>(),
      cookingTime: (fields[6] as num).toInt(),
      nutrition: fields[7] as Nutrition,
      mealTypes: (fields[8] as List?)?.cast<int>(),
      dietLabels: (fields[9] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.servings)
      ..writeByte(3)
      ..write(obj.info)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.cookingTime)
      ..writeByte(7)
      ..write(obj.nutrition)
      ..writeByte(8)
      ..write(obj.mealTypes)
      ..writeByte(9)
      ..write(obj.dietLabels)
      ..writeByte(10)
      ..write(obj.imgUrl)
      ..writeByte(11)
      ..write(obj.gi)
      ..writeByte(12)
      ..write(obj.gl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
