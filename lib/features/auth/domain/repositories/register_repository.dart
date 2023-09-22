import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterBody body);
}
