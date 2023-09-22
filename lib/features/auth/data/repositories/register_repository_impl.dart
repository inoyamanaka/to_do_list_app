import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/auth/data/datasources/register_datasource.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/register_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl(this.dataSource);

  final RegisterDataSource dataSource;
  @override
  Future<Either<Failure, RegisterEntity>> register(RegisterBody body) async {
    try {
      final remoteActivity = await dataSource.register(body);
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
