// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  LoginEntity({
    required this.access_token,
    required this.token_type,
  });
  String access_token;
  String token_type;

  @override
  List<Object?> get props => [access_token, token_type];
}
