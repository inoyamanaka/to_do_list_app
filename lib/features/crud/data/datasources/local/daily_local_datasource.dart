import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_daily_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class DailyLocalDatasource {
  Future<List<DailyActivity>> getListDailyActivity();
}

class DailyLocalDatasourceImpl implements DailyLocalDatasource {
  final box = Hive.box(dailyBox);
  @override
  Future<List<DailyActivity>> getListDailyActivity() async {
    final values = List<DailyActivity>.from(box.values.cast<DailyActivity>());
    return values;
  }
}
