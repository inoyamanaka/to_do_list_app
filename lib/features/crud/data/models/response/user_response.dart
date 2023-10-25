import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';

part 'user_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.username,
    required super.alamat,
    required super.nomorHp,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
