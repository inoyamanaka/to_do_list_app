import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/project_repository.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class LocalGetProjectUseCase {
  LocalGetProjectUseCase(this.repository);

  final ProjectRepository repository;

  Future<List<ProjectActivity>> call(NoParams params) {
    return repository.getProject();
  }
}
