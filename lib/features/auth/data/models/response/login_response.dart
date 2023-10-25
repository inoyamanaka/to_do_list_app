// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LoginModel extends LoginEntity {
  const LoginModel({
    required super.accessToken,
    required super.tokenType,
    required super.id,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
