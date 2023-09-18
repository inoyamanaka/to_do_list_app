import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/activity_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class GetActivityUseCase extends UseCase<DataActivityEntity, NoParams>{
  GetActivityUseCase(this.repository);

  final ActivityRepository repository;

  @override
  Future<Either<Failure, DataActivityEntity>> call(NoParams params) {
    return repository.getActivity();
  }
}
