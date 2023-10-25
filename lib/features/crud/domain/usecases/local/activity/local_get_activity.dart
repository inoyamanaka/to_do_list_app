                import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class LocalGetActivityUseCase {
  LocalGetActivityUseCase(this.repository);

  final LocalActivityRepository repository;

  Future<List<Activity>> call(NoParams params) {
    return repository.getLocalActivity();
  }
}
