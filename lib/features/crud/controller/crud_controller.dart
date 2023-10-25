import 'dart:async';

import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/domain/entities/user_entity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_add_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_delete_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_get_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/project/local_add_project.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/project/local_get_project.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/statistic/statistic_get.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/user_usecase.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class CrudController extends GetxController
    with StateMixin<Iterable<DataModel>> {
  CrudController(
    this.localGetActivityUseCase,
    this.localAddActivityUseCase,
    this.localDeleteActivityUseCase,
    this.localGetStatisticUseCase,
    this.userUsecase,
    this.localAddProjectUseCase,
    this.localGetProjectUseCase,
  );

  final LocalGetActivityUseCase localGetActivityUseCase;
  final LocalAddActivityUseCase localAddActivityUseCase;
  final LocalDeleteActivityUseCase localDeleteActivityUseCase;

  final LocalAddProjectUseCase localAddProjectUseCase;
  final LocalGetProjectUseCase localGetProjectUseCase;

  final LocalGetStatisticUseCase localGetStatisticUseCase;
  final UserUsecase userUsecase;

  final completer = Completer<void>();

  // state
  RxList<List<Activity>> result = <List<Activity>>[].obs;
  RxList<List<ProjectActivity>> project_list = <List<ProjectActivity>>[].obs;

  RxList<List<StatisticDataModel>> statisticResult =
      <List<StatisticDataModel>>[].obs;

  // loading
  RxBool valuesLoading = false.obs;
  RxList<List<UserEntity>> user_data = <List<UserEntity>>[].obs;

  // ACTIVITY
  Future<void> getActivity() async {
    final response = await localGetActivityUseCase.call(NoParams());
    result.assign(response);
  }

  Future<void> addActivity(Activity body) async {
    await localAddActivityUseCase.call(body);
  }

  Future<void> deleteActivity(int index, String id) async {
    await localDeleteActivityUseCase.call(index, id);
  }

  Future<void> getStatistic() async {
    final response = await localGetStatisticUseCase.call(NoParams());
    statisticResult.assign(response);
  }

  Future<void> updateStatistic(String category, StatisticDataModel data) async {
    await localGetStatisticUseCase.update(category, data);
  }

  // PROJECT
  Future<void> addProject(ProjectActivity body) async {
    await localAddProjectUseCase.call(body);
  }

  Future<void> getProject() async {
    final response = await localGetProjectUseCase.call(NoParams());

    project_list.assign(response);
  }

  Future<void> getUser(int userId) async {
    final failureorSuccess = await userUsecase.call(userId);
    await failureorSuccess.fold(
      (error) async {
        return error;
      },
      (data) async {
        user_data.assign([data]);
        completer.complete();
      },
    );
  }
}
