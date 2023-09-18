// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';

part 'activity_response.g.dart';

@JsonSerializable(createToJson: false)
class ActivityModel extends UserActivityEntity {
  ActivityModel({
    required super.email,
    required super.id,
    required super.isActive,
    required List<DataActivityModel> super.items,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataActivityModel extends DataActivityEntity {
  DataActivityModel({
    required super.title,
    required super.description,
    required super.category,
    required super.id,
    required super.ownerId,
  });

  factory DataActivityModel.fromJson(Map<String, dynamic> json) =>
      _$DataActivityModelFromJson(json);
}
