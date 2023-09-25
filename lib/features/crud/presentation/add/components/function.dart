import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/dialogue.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

Future<void> createDataModelAndScheduleNotification({
  required String name,
  required String category,
  required String date,
  required String startTime,
  required String finishTime,
  required DateTime selectedDate,
  required int onGoing,
  required int onFinish,
  required BuildContext context,
}) async {
  // Membuat objek DataModel
  final dataModel = DataModel(
    name: name,
    category: category,
    date: date,
    startTime: startTime,
    finishTime: finishTime,
  );

  final statisticModel = StatisticDataModel(category, onFinish, onGoing);
  await c.addActivity(dataModel);

  if (c.statistic_result.isEmpty) {
  } else {
    await c.updateStatistic(category, statisticModel);
    await c.getStatistic();
  }

  // Penjadwalan notifikasi
  try {
    await NotificationService().scheduleNotification(
      title: 'Scheduled Notification',
      body: '$selectedDate',
      scheduledNotificationDateTime: selectedDate,
    );
  } catch (e) {
    if (context.mounted) {
      return DialogueBox.show(
        context: context,
        title: 'Kesalahan',
        btnOkOnPress: () {},
        description: 'Mohon masukan start time dengan benar',
        type: DialogType.error,
      );
    }
  }

  Get.showSnackbar(
    const GetSnackBar(
      snackPosition: SnackPosition.TOP,
      title: 'Pemberitahuan',
      message: 'Aktivitas berhasil ditambahkan',
      icon: Icon(Icons.refresh),
      duration: Duration(seconds: 3),
    ),
  );
}

String? validateInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'Harus diisi';
  }
  return null;
}
