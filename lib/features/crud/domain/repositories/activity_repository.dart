import 'package:dartz/dartz.dart';
import 'package:to_do_list_app/features/crud/data/models/request/activity_request.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

abstract class ActivityRepository {
  Future<Either<Failure, DataActivityEntity>> getActivity();
  Future<Either<Failure, DataActivityEntity>> addActivity(
    DataActivityBody body,
  );
}
