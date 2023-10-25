import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/dialogue.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/infrastructure/shared/widget/custom_snackbar.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

bool isLater(String time1, String time2) {
  final format = DateFormat('HH:mm');

  // Konversi string waktu ke objek DateTime
  final dateTime1 = format.parse(time1);
  final dateTime2 = format.parse(time2);

  // Bandingkan dua objek DateTime
  return dateTime1.isAfter(dateTime2);
}

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
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    category: category,
    startTime: startTime,
    finishTime: finishTime,
  );
  final activityModel = Activity(date, [dataModel]);
  final statisticModel = StatisticDataModel(category, onFinish, onGoing);

  if (result.statisticResult.isEmpty) {
  } else {
    await result.updateStatistic(category, statisticModel);
    await result.getStatistic();
  }

  // Penjadwalan notifikasi
  try {
    final result = isLater(startTime, finishTime);

    if (result) {
      throw Exception('Waktu finish melbihi waktu start');
    } else {
      await NotificationService().scheduleNotification(
        title: 'Sudah waktunya....',
        body: '$startTime:$finishTime - $name',
        scheduledNotificationDateTime: selectedDate,
      );
    }
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

  // add data
  await result.addActivity(activityModel);
  if (context.mounted) {
    const TodoSnackbar(
      title: 'Pemberitahuan',
      message: 'Aktivitas berhasil ditambahkan',
      type: SnackbarType.success,
    ).show();
  }
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

DateTime parseAndFormatDate(String dateInputText, String startTime) {
  // Mengonversi format input tanggal menjadi 'yyyy-MM-dd'
  final selectedDate = DateFormat('dd MMMM yyyy').parse(dateInputText);
  final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

  // Menggabungkan tanggal dan waktu menjadi format 'yyyy-MM-dd HH:mm:ss.SSS'
  final finalDate = '$formattedDate $startTime:00.000';

  // Mengonversi format akhir menjadi objek DateTime
  final finalDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(finalDate);

  return finalDateTime;
}
