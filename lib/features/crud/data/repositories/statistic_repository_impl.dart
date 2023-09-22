import 'package:to_do_list_app/features/crud/data/datasources/local/statistic_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/statistic_repository.dart';

class StatisticRepositoryImpl implements StatisticRepository {
  StatisticRepositoryImpl(this.dataSource);

  final StatisticLocalDataSource dataSource;

  @override
  Future<List<StatisticDataModel>> countLocalActivity() {
    print('sampe dimisi');
    return dataSource.countLocalActivity();
  }
}
