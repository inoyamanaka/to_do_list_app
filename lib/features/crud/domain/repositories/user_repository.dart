import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser(int userId);
}
