import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/crud/data/datasources/activity_remote_datasource.dart';
import 'package:to_do_list_app/features/crud/data/models/request/activity_request.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/activity_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl(this.dataSource);

  final ActivityRemoteDataSource dataSource;

  @override
  Future<Either<Failure, DataActivityEntity>> addActivity(
    DataActivityBody body,
  ) async {
     try {
      final remoteActivity = await dataSource.addActivity(body);
      return Right(remoteActivity);
    } on DioException catch (e) {
      final serverFailure = e.response != null
          ? ServerFailure.fromJson(e.response!.data as Map<String, dynamic>)
          : ServerFailure(e.message ?? 'Dio request failed');
      return Left(serverFailure);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DataActivityEntity>> getActivity() async {
    try {
      final remoteActivity = await dataSource.getActivity();
      return Right(remoteActivity);
    } on DioException catch (e) {
      final serverFailure = e.response != null
          ? ServerFailure.fromJson(e.response!.data as Map<String, dynamic>)
          : ServerFailure(e.message ?? 'Dio request failed');
      return Left(serverFailure);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
