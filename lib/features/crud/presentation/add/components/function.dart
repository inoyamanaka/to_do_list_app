import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

Future<void> createDataModelAndScheduleNotification({
  required String name,
  required String category,
  required String date,
  required String startTime,
  required String finishTime,
  required DateTime selectedDate,
}) async {
  // Membuat objek DataModel
  final dataModel = DataModel(
    name: name,
    category: category,
    date: date,
    startTime: startTime,
    finishTime: finishTime,
  );
  await c.addActivity(dataModel);

  // Penjadwalan notifikasi
  await NotificationService().scheduleNotification(
    title: 'Scheduled Notification',
    body: '$selectedDate',
    scheduledNotificationDateTime: selectedDate,
  );

  Get.showSnackbar(
    const GetSnackBar(
      title: 'Pemberitahuan',
      message: 'Aktivitas berhasil ditambahkan',
      icon: Icon(Icons.refresh),
      duration: Duration(seconds: 3),
    ),
  );
}

String? validateInput(String? value) {
  print(value);
  if (value == null || value.isEmpty) {
    return 'Harus diisi';
  }
  return null;
}
