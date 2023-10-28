import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/data/models/response/register_response.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';
import 'package:to_do_list_app/infrastructure/constants/api_path.dart';

// ignore: one_member_abstracts
abstract class RegisterDataSource {
  Future<RegisterEntity> register(RegisterBody body);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  RegisterDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<RegisterEntity> register(RegisterBody body) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiPath.register,
      data: body.toJson(),
    );

    return RegisterModel.fromJson(response.data!);
  }
}
