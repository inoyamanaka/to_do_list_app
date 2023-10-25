import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';

abstract class ProjectRepository {
  Future<List<ProjectActivity>> getProject();
  Future<void> addProject(ProjectActivity body);
}
