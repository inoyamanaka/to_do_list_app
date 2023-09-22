// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  RegisterEntity({
    required this.email,
    required this.username,
    required this.password,
    required this.id,
  });
  String email;
  String username;
  String password;
  int id;

  @override
  // TODO: implement props
  List<Object?> get props => [email, username, password, id];
}
