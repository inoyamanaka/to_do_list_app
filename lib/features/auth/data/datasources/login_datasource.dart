import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/auth/data/datasources/local_verification.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/data/models/response/login_response.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/infrastructure/constants/api_path.dart';
import 'package:to_do_list_app/infrastructure/error/excaptions.dart';

// ignore: one_member_abstracts
abstract class LoginDataSource {
  Future<LoginEntity> login(LoginBody body);
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl(this._client, this.localVerificationDatasource);

  final Dio _client;
  final LocalVerificationDatasource localVerificationDatasource;
  @override
  Future<LoginEntity> login(LoginBody body) async {
    try {
      final formData = FormData.fromMap({
        'grant_type': 'password',
        'username': body.email,
        'password': body.password,
        'scope': '',
        'client_id': '',
        'client_secret': '',
      });
      final response = await _client
          .post<Map<String, dynamic>>(
            ApiPath.login,
            data: formData,
          )
          .timeout(const Duration(seconds: 7));
      await localVerificationDatasource
          .addToken(LoginModel.fromJson(response.data!));
      return LoginModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
