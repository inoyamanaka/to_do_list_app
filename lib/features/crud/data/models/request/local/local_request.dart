// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'local_request.g.dart';

@HiveType(typeId: 0)
class Activity extends HiveObject {
  Activity(this.date, this.data,);

  @HiveField(0)
  final String date;

  @HiveField(1)
  final List<DataModel> data;

  @override
  String toString() => 'Activity(date: $date, data: $data)';
}

@HiveType(typeId: 1)
class DataModel extends HiveObject{
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? startTime;
  @HiveField(2)
  final String? finishTime;
  @HiveField(3)
  final String? category;

  DataModel({
    this.name,
    this.startTime,
    this.finishTime,
    this.category,
  });

  @override
  String toString() {
    return 'DataModel(name: $name, startTime: $startTime, finishTime: $finishTime, category: $category)';
  }
}
