import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/user_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class UserUsecase extends UseCase<UserEntity, int> {
  UserUsecase(this.userRepository);
  final UserRepository userRepository;
  @override
  Future<Either<Failure, UserEntity>> call(int userId) {
    return userRepository.getUser(userId);
  }
}
