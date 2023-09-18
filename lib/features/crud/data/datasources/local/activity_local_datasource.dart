// ignore_for_file: strict_raw_type

import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class ActivityLocalDataSource {
  // Future<Iterable<DataModel>> addLocalActivity();
  Future<List<DataModel>> getLocalActivity();
  Future<void> addLocalActivity(DataModel body);
  Future<void> deleteLocalActivity(int index);
}

class ActivityLocalDataSourceImpl implements ActivityLocalDataSource {
  Box box = Hive.box(databaseBox);

  @override
  Future<List<DataModel>> getLocalActivity() async {
    final values = List<DataModel>.from(box.values.cast<DataModel>());
    return values;
  }

  @override
  Future<void> addLocalActivity(DataModel body) async {
    await box.add(body);
  }

  @override
  Future<void> deleteLocalActivity(int index) async {
    await box.deleteAt(index);
  }
}
