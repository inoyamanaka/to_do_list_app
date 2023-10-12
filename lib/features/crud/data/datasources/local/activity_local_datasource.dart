// ignore_for_file: strict_raw_type, cascade_invocations, avoid_dynamic_calls, inference_failure_on_untyped_parameter

import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class ActivityLocalDataSource {
  // Future<Iterable<DataModel>> addLocalActivity();
  Future<List<Activity>> getLocalActivity();
  Future<void> addLocalActivity(Activity body);
  Future<void> deleteLocalActivity(int index);
}

class ActivityLocalDataSourceImpl implements ActivityLocalDataSource {
  Box box = Hive.box(databaseBox);

  List<Activity> mergeActivities(List<Activity> activities) {
    final activityMap = <String, Activity>{};

    for (final activity in activities) {
      if (!activityMap.containsKey(activity.date)) {
        activityMap[activity.date] = Activity(activity.date, []);
      }

      // Gabungkan data dengan tanggal yang sama
      activityMap[activity.date]!.data.addAll(activity.data);
    }
    return activityMap.values.toList();
  }

  @override
  Future<List<Activity>> getLocalActivity() async {
    final values = List<Activity>.from(box.values.cast<Activity>());
    return values;
  }

  @override
  Future<void> addLocalActivity(Activity body) async {
    await box.add(body);
    final values = List<Activity>.from(box.values.cast<Activity>());

    final mergedActivities = mergeActivities(values);
    await box.clear();
    await box.addAll(mergedActivities);

    // Mengambil semua data dari box dan mengonversinya menjadi List<DataModel>
    final dataList = box.values.toList();
    for (var i = 0; i < dataList.length; i++) {
      dataList[i].data.sort((a, b) {
        // Parsing startTime ke dalam bentuk DateTime untuk perbandingan
        final timeA = DateTime.parse('2023-09-28 ${a.startTime}');
        final timeB = DateTime.parse('2023-09-28 ${b.startTime}');

        return timeA.compareTo(timeB); // Membandingkan waktu
      });
    }

    // Mengurutkan dataList berdasarkan startTime
    await box.clear();
    await box.addAll(dataList);
  }

  @override
  Future<void> deleteLocalActivity(int index) async {
    final activity = await box.getAt(index);
    if (activity != null) {
      (activity['data'] as List).removeWhere(
        (data) =>
            data['name'] == 'dwada' &&
            data['startTime'] == '01:38' &&
            data['finishTime'] == '03:34' &&
            data['category'] == 'category',
      );
    }
    await box.deleteAt(index);
  }
}
