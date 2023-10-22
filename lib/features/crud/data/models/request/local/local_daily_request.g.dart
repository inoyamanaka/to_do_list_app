// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_daily_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyActivityAdapter extends TypeAdapter<DailyActivity> {
  @override
  final int typeId = 0;

  @override
  DailyActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyActivity(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyActivity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameCategory)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.finishTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
