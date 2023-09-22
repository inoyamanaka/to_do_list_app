// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:hive/hive.dart';

part 'local_request.g.dart';


@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? date;

  @HiveField(2)
  final String? startTime;

  @HiveField(3)
  final String? finishTime;

  @HiveField(4)
  final String? category;
  
  DataModel({
    this.name,
    this.date,
    this.startTime,
    this.finishTime,
    this.category,
  });

  @override
  String toString() {
    return 'DataModel(name: $name, date: $date, startTime: $startTime, finishTime: $finishTime, category: $category)';
  }
}
