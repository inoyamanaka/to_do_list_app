// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_project_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectActivityAdapter extends TypeAdapter<ProjectActivity> {
  @override
  final int typeId = 2;

  @override
  ProjectActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectActivity(
      projectId: fields[0] as String,
      projectName: fields[1] as String,
      projectDate: fields[2] as String,
      projectDescription: fields[3] as String,
      projectDataActivity: (fields[4] as List).cast<ProjectDataActivity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectActivity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.projectId)
      ..writeByte(1)
      ..write(obj.projectName)
      ..writeByte(2)
      ..write(obj.projectDate)
      ..writeByte(3)
      ..write(obj.projectDescription)
      ..writeByte(4)
      ..write(obj.projectDataActivity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProjectDataActivityAdapter extends TypeAdapter<ProjectDataActivity> {
  @override
  final int typeId = 3;

  @override
  ProjectDataActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectDataActivity(
      projectDataName: fields[0] as String,
      projectStartTime: fields[1] as String,
      projectFinishTime: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectDataActivity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.projectDataName)
      ..writeByte(1)
      ..write(obj.projectStartTime)
      ..writeByte(2)
      ..write(obj.projectFinishTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectDataActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
