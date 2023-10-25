import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/auth/data/datasources/local_verification.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/data/models/response/login_response.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/infrastructure/constants/api_path.dart';

abstract class LoginDataSource {
  Future<LoginEntity> login(LoginBody body);
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl(this._client, this.localVerificationDatasource);

  final Dio _client;
  final LocalVerificationDatasource localVerificationDatasource;
  @override
  Future<LoginEntity> login(LoginBody body) async {
    final formData = FormData.fromMap({
      'grant_type': 'password',
      'username': body.email,
      'password': body.password,
      'scope': '',
      'client_id': '',
      'client_secret': '',
    });
    final response = await _client.post<Map<String, dynamic>>(
      ApiPath.login,
      data: formData,
    );

    print(response.statusCode);

    await localVerificationDatasource
        .addToken(LoginModel.fromJson(response.data!));

    return LoginModel.fromJson(response.data!);
  }
}
