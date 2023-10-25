// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:hive/hive.dart';

part 'local_data_request.g.dart';

@HiveType(typeId: 1)
class StatisticDataModel extends HiveObject {
  StatisticDataModel(
    this.nameCategory,
    this.categoryFinished,
    this.categoryOngoing,
  );

  @HiveField(0)
  final String? nameCategory;
  @HiveField(1)
  final int? categoryFinished;
  @HiveField(2)
  final int? categoryOngoing;

  @override
  String toString() =>
      'StatisticDataModel(nameCategory: $nameCategory, categoryFinished: $categoryFinished, categoryOngoing: $categoryOngoing)';
}
