// ignore_for_file: cascade_invocations

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/controller/auth_controller.dart';
import 'package:to_do_list_app/features/auth/data/datasources/local_verification.dart';
import 'package:to_do_list_app/features/auth/data/datasources/login_datasource.dart';
import 'package:to_do_list_app/features/auth/data/datasources/register_datasource.dart';
import 'package:to_do_list_app/features/auth/data/repositories/login_repository_impl.dart';
import 'package:to_do_list_app/features/auth/data/repositories/register_repository_impl.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/login_repository.dart';
import 'package:to_do_list_app/features/auth/domain/repositories/register_repository.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:to_do_list_app/infrastructure/env/env_config.dart';
import 'package:to_do_list_app/infrastructure/network/dio_handler.dart';
import 'package:to_do_list_app/infrastructure/utils/shared_prefs.dart';

class AuthBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final config = EnvConfig.getInstance();
    final prefs = await SharedPrefs.getInstance();
    Get.lazyPut(
      () => config,
    );
    Get.lazyPut(
      () => prefs,
    );
    Get.lazyPut<Dio>(() => DioHandler().dio, fenix: true);
    // datasources
    Get.lazyPut<LocalVerificationDatasource>(
      LocalVerificationDatasourceImpl.new,
    );
    Get.lazyPut<RegisterDataSource>(
      () => RegisterDataSourceImpl(Get.find()),
    );
    Get.lazyPut<LoginDataSource>(
      () => LoginDataSourceImpl(Get.find(), Get.find()),
    );

    // repository
    Get.lazyPut<RegisterRepository>(
      () => RegisterRepositoryImpl(Get.find()),
    );
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(Get.find()),
    );

    // usecase
    Get.lazyPut(() => RegisterUsecase(Get.find()));
    Get.lazyPut(() => LoginUsecase(Get.find()));

    // controller
    Get.lazyPut<AuthController>(
      () => AuthController(Get.find(), Get.find()),
    );
  }
}
