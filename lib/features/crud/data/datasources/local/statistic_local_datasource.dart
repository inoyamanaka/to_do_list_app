// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type

import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class StatisticLocalDataSource {
  // Future<Iterable<DataModel>> addLocalActivity();
  Future<List<StatisticDataModel>> countLocalActivity();
  Future<void> updateStatistic(String category, StatisticDataModel data);
}

class StatisticocalDataSourceImpl implements StatisticLocalDataSource {
  Box item = Hive.box(activityBox);

  @override
  Future<List<StatisticDataModel>> countLocalActivity() async {
    if (item.get('Olahraga') == null) {
      await item.put('Olahraga', StatisticDataModel('Olahraga', 0, 0));
    }

    if (item.get('Belajar') == null) {
      await item.put('Belajar', StatisticDataModel('Belajar', 0, 0));
    }

    if (item.get('Pekerjaan') == null) {
      await item.put('Pekerjaan', StatisticDataModel('Pekerjaan', 0, 0));
    }

    if (item.get('Hobi') == null) {
      await item.put('Hobi', StatisticDataModel('Hobi', 0, 0));
    }

    if (item.get('Ibadah') == null) {
      await item.put('Ibadah', StatisticDataModel('Ibadah', 0, 0));
    }

    if (item.get('Hiburan') == null) {
      await item.put('Hiburan', StatisticDataModel('Hiburan', 0, 0));
    }

    final values =
        List<StatisticDataModel>.from(item.values.cast<StatisticDataModel>());

    return values;
  }

  @override
  Future<void> updateStatistic(String category, StatisticDataModel data) async {
    await item.put(category, data);
    // if (category == 'Olahraga') {
    //   await item.put(, data);
    // }
    // if (category == 'Belajar') {
    //   await item.putAt(0, data);
    // }
    // if (category == 'Pekerjaan') {
    //   await item.putAt(2, data);
    // }
    // if (category == 'Hobi') {
    //   await item.putAt(3, data);
    // }
    // if (category == 'Ibadah') {
    //   await item.putAt(4, data);
    // }
    // if (category == 'Hiburan') {
    //   await item.putAt(5, data);
    // }

    // item.values.cast<StatisticDataModel>();
  }
}
