import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class ProjectLocalDataSource {
  // Future<Iterable<DataModel>> addLocalActivity();
  Future<List<ProjectActivity>> getLocalProject();
  Future<void> addLocalProject(ProjectActivity body);
  Future<void> deleteLocalProject(int index, String id);
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  Box<dynamic> box = Hive.box(projectBox);

  @override
  Future<void> addLocalProject(ProjectActivity body) async {
    // TODO: implement addLocalProject
    await box.add(body);
    // print(box.values);
    // print(box.values.length);
  }

  @override
  Future<void> deleteLocalProject(int index, String id) {
    // TODO: implement deleteLocalProject
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectActivity>> getLocalProject() async {
    final values =
        List<ProjectActivity>.from(box.values.cast<ProjectActivity>());
    return values;
  }
}
