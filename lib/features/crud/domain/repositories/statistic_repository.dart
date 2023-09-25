import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';

abstract class StatisticRepository {
  Future<List<StatisticDataModel>> countLocalActivity();
  Future<void> updateStatistic(String category, StatisticDataModel data);

}
