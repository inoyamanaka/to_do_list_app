// ignore_for_file: cascade_invocations

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/datasources/local/activity_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/datasources/local/project_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/datasources/local/statistic_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/datasources/user_datasource.dart';
import 'package:to_do_list_app/features/crud/data/repositories/local_activity_repository_impl.dart';
import 'package:to_do_list_app/features/crud/data/repositories/project_repository_impl.dart';
import 'package:to_do_list_app/features/crud/data/repositories/statistic_repository_impl.dart';
import 'package:to_do_list_app/features/crud/data/repositories/user_repository_impl.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/project_repository.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/statistic_repository.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/user_repository.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_add_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_delete_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/activity/local_get_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/project/local_add_project.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/project/local_get_project.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/statistic/statistic_get.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/user_usecase.dart';
import 'package:to_do_list_app/infrastructure/network/dio_handler.dart';

class CrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => DioHandler().dio, fenix: true);
    // datasources
    Get.lazyPut<ActivityLocalDataSource>(
      ActivityLocalDataSourceImpl.new,
    );
    Get.lazyPut<StatisticLocalDataSource>(
      StatisticocalDataSourceImpl.new,
    );
    Get.lazyPut<UserDataSource>(
      () => UserDataSourceImpl(Get.find()),
    );
    Get.lazyPut<ProjectLocalDataSource>(
      ProjectLocalDataSourceImpl.new,
    );

    // repository
    Get.lazyPut<LocalActivityRepository>(
      () => LocalActivityRepositoryImpl(Get.find()),
    );
    Get.lazyPut<StatisticRepository>(
      () => StatisticRepositoryImpl(Get.find()),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find()),
    );
    Get.lazyPut<ProjectRepository>(
      () => ProjectRepositoryImpl(Get.find()),
    );

    // usecase
    Get.lazyPut(() => LocalGetActivityUseCase(Get.find()));
    Get.lazyPut(() => LocalAddActivityUseCase(Get.find()));
    Get.lazyPut(() => LocalDeleteActivityUseCase(Get.find()));
    Get.lazyPut(() => LocalGetStatisticUseCase(Get.find()));
    Get.lazyPut(() => UserUsecase(Get.find()));
    Get.lazyPut(() => LocalAddProjectUseCase(Get.find()));
    Get.lazyPut(() => LocalGetProjectUseCase(Get.find()));

    // controller
    Get.lazyPut<CrudController>(
      () => CrudController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
