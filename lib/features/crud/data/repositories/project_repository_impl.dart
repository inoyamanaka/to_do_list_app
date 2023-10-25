import 'package:to_do_list_app/features/crud/data/datasources/local/project_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl(this.dataSource);

  final ProjectLocalDataSource dataSource;

  @override
  Future<List<ProjectActivity>> getProject() async {
    final getProject = await dataSource.getLocalProject();
    return getProject;
  }

  @override
  Future<void> addProject(ProjectActivity body) async {
    await dataSource.addLocalProject(body);
  }
}
