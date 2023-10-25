import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/crud/data/datasources/user_datasource.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/user_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;
  @override
  Future<Either<Failure, UserEntity>> getUser(int userId) async {
    try {
      final remoteActivity = await dataSource.getUser(userId);
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
