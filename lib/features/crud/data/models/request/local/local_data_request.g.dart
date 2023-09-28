// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_data_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticDataModelAdapter extends TypeAdapter<StatisticDataModel> {
  @override
  final int typeId = 2;

  @override
  StatisticDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisticDataModel(
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StatisticDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameCategory)
      ..writeByte(1)
      ..write(obj.categoryFinished)
      ..writeByte(2)
      ..write(obj.categoryOngoing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
