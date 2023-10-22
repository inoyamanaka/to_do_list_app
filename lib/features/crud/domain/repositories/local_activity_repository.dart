import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';

abstract class LocalActivityRepository {
  Future<List<Activity>> getLocalActivity();
  Future<void> addLocalActivity(Activity body);
  Future<void> deleteLocalActivity(int index, String id);

}
