import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/crud/data/models/response/user_response.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';
import 'package:to_do_list_app/infrastructure/constants/api_path.dart';

abstract class UserDataSource {
  Future<UserEntity> getUser(int userId);
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<UserEntity> getUser(int userId) async {
    final response = await _client.get<Map<String, dynamic>>(
      '${ApiPath.user}/$userId',
    );
    return UserModel.fromJson(response.data!);
  }
}
