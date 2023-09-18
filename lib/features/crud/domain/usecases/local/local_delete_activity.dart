import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';

class LocalDeleteActivityUseCase {
  LocalDeleteActivityUseCase(this.repository);

  final LocalActivityRepository repository;

  Future<void> call(int index) {
    return repository.deleteLocalActivity(index);
  }
}
