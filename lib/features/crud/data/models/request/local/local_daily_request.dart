import 'package:hive/hive.dart';

part 'local_daily_request.g.dart';

@HiveType(typeId: 0)
class DailyActivity extends HiveObject {
  DailyActivity(this.nameCategory, this.startTime, this.finishTime);
  @HiveField(0)
  final String? nameCategory;
  @HiveField(1)
  final String? startTime;
  @HiveField(2)
  final String? finishTime;
}
