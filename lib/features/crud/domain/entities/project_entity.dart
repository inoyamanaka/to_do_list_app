import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  const ProjectEntity({
    required this.projectName,
    required this.projectDate,
    required this.projectDescription,
    required this.projectDataActivity,
  });

  final String projectName;

  final String projectDate;

  final String? projectDescription;

  final List<ProjectDataEntity> projectDataActivity;

  @override
  List<Object?> get props =>
      [projectName, projectDate, projectDescription, projectDataActivity];
}

class ProjectDataEntity extends Equatable {
  const ProjectDataEntity({
    required this.projectDataName,
    required this.projectStartTime,
    required this.projectFinishTime,
  });

  final String? projectDataName;
  final String? projectStartTime;
  final String? projectFinishTime;

  @override
  List<Object?> get props =>
      [projectDataName, projectStartTime, projectFinishTime];
}
