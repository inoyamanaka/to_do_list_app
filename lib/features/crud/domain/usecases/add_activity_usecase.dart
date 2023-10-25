import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/activity_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class AddActivityUseCase extends UseCase<DataActivityEntity, ProjectActivity> {
  AddActivityUseCase(this.repository);

  final ActivityRepository repository;

  @override
  Future<Either<Failure, DataActivityEntity>> call(ProjectActivity params) {
    return repository.addActivity(params);
  }
}
