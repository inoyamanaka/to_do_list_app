// ignore_for_file: cascade_invocations

import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/datasources/local/activity_local_datasource.dart';
import 'package:to_do_list_app/features/crud/data/repositories/local_activity_repository_impl.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/local_activity_repository.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_add_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_delete_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_get_activity.dart';

class CrudBinding extends Bindings {
  @override
  void dependencies() {
    // datasources
    Get.lazyPut<ActivityLocalDataSource>(
      ActivityLocalDataSourceImpl.new,
    );

    // repository
    Get.lazyPut<LocalActivityRepository>(
      () => LocalActivityRepositoryImpl(Get.find()),
    );

    // usecase
    Get.lazyPut(() => LocalGetActivityUseCase(Get.find()));
    Get.lazyPut(() => LocalAddActivityUseCase(Get.find()));
    Get.lazyPut(() => LocalDeleteActivityUseCase(Get.find()));

    // controller
    Get.lazyPut<CrudController>(
      () => CrudController(Get.find(), Get.find(), Get.find()),
    );
  }
}
