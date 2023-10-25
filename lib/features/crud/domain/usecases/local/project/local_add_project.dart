import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/project_repository.dart';

class LocalAddProjectUseCase {
  LocalAddProjectUseCase(this.repository);

  final ProjectRepository repository;

  Future<void> call(ProjectActivity body) {
    return repository.addProject(body);
  }
}
