// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';

part 'register_response.g.dart';

@JsonSerializable(createToJson: false)
class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.email,
    required super.username,
    required super.password,
    required super.id,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
