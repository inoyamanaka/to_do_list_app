// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  LoginModel({required super.access_token, required super.token_type});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
