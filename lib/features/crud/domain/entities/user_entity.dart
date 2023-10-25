import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.email,
    required this.username,
    required this.alamat,
    required this.nomorHp,
  });
  final String email;
  final String username;
  final String alamat;
  final String nomorHp;

  @override
  List<Object?> get props => [email, username, alamat, nomorHp];
}
