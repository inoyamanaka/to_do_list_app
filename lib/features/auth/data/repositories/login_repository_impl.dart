import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/auth/data/datasources/login_datasource.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/login_repository.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.dataSource);

  final LoginDataSource dataSource;
  @override
  Future<Either<Failure, LoginEntity>> login(LoginBody body) async {
    try {
      final remoteActivity = await dataSource.login(body);
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
