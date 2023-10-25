// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'project_request.g.dart';

@JsonSerializable(createFactory: false)
class ProjectBody {
  const ProjectBody({
    required this.projectName,
    required this.projectDate,
    required this.projectDescription,
    required this.projectDataName,
    required this.projectStartTime,
    required this.projectFinishTime,
  });

  final String projectName;
  final String projectDate;
  final String projectDescription;
  final String projectDataName;
  final String projectStartTime;
  final String projectFinishTime;

  Map<String, dynamic> toJson() => _$ProjectBodyToJson(this);
}
