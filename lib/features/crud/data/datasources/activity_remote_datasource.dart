import 'package:dio/dio.dart';
import 'package:to_do_list_app/features/crud/data/models/request/activity_request.dart';
import 'package:to_do_list_app/features/crud/data/models/response/activity_response.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/infrastructure/error/excaptions.dart';

abstract class ActivityRemoteDataSource {
  Future<DataActivityEntity> getActivity();
  Future<DataActivityEntity> addActivity(DataActivityBody body);
}

class ActivityRemoteDataSourceImpl implements ActivityRemoteDataSource {
  ActivityRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<DataActivityEntity> getActivity() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        'url',
      );
      return DataActivityModel.fromJson(response.data!);
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

  @override
  Future<DataActivityEntity> addActivity(DataActivityBody body) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        'url',
        data: body.toJson(),
      );
      return DataActivityModel.fromJson(response.data!);
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
