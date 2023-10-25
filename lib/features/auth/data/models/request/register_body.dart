import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(createToJson: true)
class RegisterBody {
  RegisterBody({
    required this.email,
    required this.username,
    required this.password,
    this.alamat = '',
    this.nomorHp = '',
  });
  final String email;
  final String username;
  final String password;
  final String? alamat;
  final String? nomorHp;

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
