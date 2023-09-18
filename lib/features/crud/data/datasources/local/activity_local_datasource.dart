// ignore_for_file: strict_raw_type, cascade_invocations, avoid_dynamic_calls

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
    // Mengambil semua data dari box dan mengonversinya menjadi List<DataModel>
    final dataList = box.values.toList();

    // Mengurutkan dataList berdasarkan startTime
    dataList.sort((a, b) {
      // Konversi string waktu menjadi objek DateTime
      final timeA = DateTime.parse('2023-09-18 ${a.startTime}');
      final timeB = DateTime.parse('2023-09-18 ${b.startTime}');

      // Bandingkan waktu
      return timeA.compareTo(timeB);
    });

    // Mengurutkan dataList berdasarkan startTime
    await box.clear();
    await box.addAll(dataList);
  }

  @override
  Future<void> deleteLocalActivity(int index) async {
    await box.deleteAt(index);
  }
}
