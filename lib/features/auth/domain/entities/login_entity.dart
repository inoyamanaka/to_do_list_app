// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.accessToken,
    required this.tokenType,
    required this.id,
  });
  final String accessToken;
  final String tokenType;
  final int id;

  @override
  List<Object?> get props => [accessToken, tokenType];
}
