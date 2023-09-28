import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';

class LocalAddActivityUseCase {
  LocalAddActivityUseCase(this.repository);

  final LocalActivityRepository repository;

  Future<void> call(Activity body) {
    return repository.addLocalActivity(body);
  }
}
