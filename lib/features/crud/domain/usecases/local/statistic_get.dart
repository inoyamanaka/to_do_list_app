import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/statistic_repository.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class LocalGetStatisticUseCase {
  LocalGetStatisticUseCase(this.repository);

  final StatisticRepository repository;

  Future<List<StatisticDataModel>> call(NoParams params) {
    print('sampee maro');
    return repository.countLocalActivity();
  }
}
