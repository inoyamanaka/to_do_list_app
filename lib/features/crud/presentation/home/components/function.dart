import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

void updateCategoryAndActivity(
  CrudController result,
  int index,
  String id,
  String category,
) {
  int onGoing;

  // index ga sama
  final dataResult = result.statisticResult[0]
      .firstWhere((data) => data.nameCategory == category);

  final onFinish = dataResult.categoryFinished! + 1;
  onGoing = dataResult.categoryOngoing!;
  final statisticModel = StatisticDataModel(
    category,
    onFinish,
    onGoing,
  );
  result
    ..updateStatistic(category, statisticModel)
    ..deleteActivity(index, id)
    ..getActivity();
}

void showConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
  AwesomeDialog(
    context: context,
    body: Center(
      child: Text(
        'Apakah Aktivitas Sudah Selesai',
        textAlign: TextAlign.center,
        style: MyTypography.bodySmall.copyWith(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnCancelOnPress: () {},
    btnCancelText: 'Belum',
    btnOkOnPress: onConfirm,
    btnOkText: 'Sudah',
  ).show();
}

Future<void> fetchDataproject() async {
  try {
    await result.getProject();
    projectList.value = result.project_list[0].toList();

    if (projectList.value.isEmpty) {
      isProjectEmpty.value = true;
    } else {
      isProjectEmpty.value = false;
    }
  } catch (e) {
    isProjectEmpty.value = true;
  }
}

Future<void> fetchDataAndUpdateList(String formattedDate) async {
  try {
    await result.getActivity();
    activityList.value = result.result[0].where((activity) {
      return activity.date == formattedDate;
    }).toList();

    if (activityList.value[0].data.isEmpty || activityList.value.isEmpty) {
      isEmptyList.value = true;
    } else {
      isEmptyList.value = false;
    }
  } catch (e) {
    isEmptyList.value = true;
  }
}
