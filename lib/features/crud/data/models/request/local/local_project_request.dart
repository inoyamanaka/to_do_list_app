import 'package:hive/hive.dart';

part 'local_project_request.g.dart';

@HiveType(typeId: 2)
class ProjectActivity extends HiveObject {
  ProjectActivity({
    required this.projectId,
    required this.projectName,
    required this.projectDate,
    required this.projectDescription,
    required this.projectDataActivity,
  });

  @HiveField(0)
  final String projectId;
  @HiveField(1)
  final String projectName;
  @HiveField(2)
  final String projectDate;
  @HiveField(3)
  final String projectDescription;
  @HiveField(4)
  final List<ProjectDataActivity> projectDataActivity;
}

@HiveType(typeId: 3)
class ProjectDataActivity extends HiveObject {
  ProjectDataActivity({
    required this.projectDataName,
    required this.projectStartTime,
    required this.projectFinishTime,
  });

  @HiveField(0)
  final String projectDataName;
  @HiveField(1)
  final String projectStartTime;
  @HiveField(2)
  final String projectFinishTime;
}
