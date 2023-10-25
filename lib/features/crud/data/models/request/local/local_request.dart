// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:hive/hive.dart';

part 'local_request.g.dart';

@HiveType(typeId: 4)
class Activity extends HiveObject {
  Activity(
    this.date,
    this.data,
  );

  @HiveField(0)
  final String date;

  @HiveField(1)
  final List<DataModel> data;

  @override
  String toString() => 'Activity(date: $date, data: $data)';
}

@HiveType(typeId: 5)
class DataModel extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? startTime;
  @HiveField(3)
  final String? finishTime;
  @HiveField(4)
  final String? category;

  DataModel({
    this.name,
    this.id,
    this.startTime,
    this.finishTime,
    this.category,
  });

  @override
  String toString() {
    return 'DataModel(name: $name, id: $id, startTime: $startTime, finishTime: $finishTime, category: $category)';
  }
}
