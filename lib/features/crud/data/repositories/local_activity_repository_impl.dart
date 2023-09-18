import 'package:to_do_list_app/features/crud/data/datasources/local/activity_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';

class LocalActivityRepositoryImpl implements LocalActivityRepository {
  LocalActivityRepositoryImpl(this.dataSource);

  final ActivityLocalDataSource dataSource;
  @override
  Future<List<DataModel>> getLocalActivity() async {
    final getActivity = await dataSource.getLocalActivity();
    return getActivity;
  }

  @override
  Future<void> addLocalActivity(DataModel body) async {
    await dataSource.addLocalActivity(body);
  }
  
  @override
  Future<void> deleteLocalActivity(int index) async {
     await dataSource.deleteLocalActivity(index);
  }
}
