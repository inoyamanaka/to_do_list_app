import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/register_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class RegisterUsecase extends UseCase<RegisterEntity, RegisterBody> {
  RegisterUsecase(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterBody body) {
    return registerRepository.register(body);
  }
}
