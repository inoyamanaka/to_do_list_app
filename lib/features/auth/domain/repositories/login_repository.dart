import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

// ignore: one_member_abstracts
abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginBody body);
}
