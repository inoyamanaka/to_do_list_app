import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';

void updateCategoryAndActivity(CrudController result, int index) {
  final onFinish = result.statisticResult[0][index].categoryFinished! + 1;
  final onGoing = result.statisticResult[0][index].categoryOngoing! + 1;
  final category = result.statisticResult[0][index].nameCategory!;
  final statisticModel = StatisticDataModel(
    category,
    onFinish,
    onGoing,
  );
  result
    ..updateStatistic(category, statisticModel)
    ..deleteActivity(index)
    ..getActivity();
}

void showConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    body: const Center(
      child: Text(
        'Apakah Aktivitas Sudah Selesai',
        style: TextStyle(
          fontStyle: FontStyle.italic,
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
