import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/login_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this.loginRepository);

  final LoginRepository loginRepository;
  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody body) {
    return loginRepository.login(body);
  }
}
