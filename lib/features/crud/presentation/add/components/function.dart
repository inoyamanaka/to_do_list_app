import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
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
    startTime: startTime,
    finishTime: finishTime,
  );
  final activityModel = Activity(date, [dataModel]);
  final statisticModel = StatisticDataModel(category, onFinish, onGoing);
  // print(activityModel);
  await result.addActivity(activityModel);

  if (result.statisticResult.isEmpty) {
  } else {
    await result.updateStatistic(category, statisticModel);
    await result.getStatistic();
  }

  // Penjadwalan notifikasi
  try {
    await NotificationService().scheduleNotification(
      title: 'Sudah waktunya....',
      body: '$startTime - $name',
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

Future<void> updateStatisticActivity(
  BuildContext context,
  CrudController activity,
  String optionSelected,
  int categoryOnGoing,
  TextEditingController nameInput,
  TextEditingController dateInput,
  TextEditingController startInput,
  TextEditingController finishInput,
  DateTime selectedDate,
) async {
  var updatedCategoryOnGoing = categoryOnGoing;
  if (activity.statisticResult.isNotEmpty) {
    updatedCategoryOnGoing = 0;

    for (final dataModel in activity.statisticResult[0]) {
      if (dataModel.nameCategory == optionSelected) {
        updatedCategoryOnGoing = dataModel.categoryOngoing!;
        updatedCategoryOnGoing += 1;

        break;
      }
    }
  } else {
    updatedCategoryOnGoing += 1;
  }

  await createDataModelAndScheduleNotification(
    name: nameInput.text,
    category: optionSelected,
    date: dateInput.text,
    startTime: startInput.text,
    finishTime: finishInput.text,
    selectedDate: selectedDate,
    onFinish: 0,
    onGoing: updatedCategoryOnGoing,
    context: context,
  );
}
