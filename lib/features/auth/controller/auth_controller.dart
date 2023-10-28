// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/data/models/response/register_response.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';
import 'package:to_do_list_app/infrastructure/shared/widget/custom_snackbar.dart';

class AuthController extends GetxController
    with StateMixin<Iterable<RegisterModel>> {
  AuthController(this.registerUsecase, this.loginUsecase);

  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;

  // loading state
  RxBool loginLoading = false.obs;
  // var vRegisterLoading = false.obs;
  // var vLoginLoading = false.obs;
  // var vLogoutLoading = false.obs;

  Future<void> register(RegisterBody body) async {
    final failureorSuccess = await registerUsecase.call(body);
    failureorSuccess.fold(
      (error) {
        const TodoSnackbar(
          title: 'Gagal',
          message: 'Email atau Password yang anda masukan salah',
          type: SnackbarType.error,
        );

        return error;
      },
      (data) async {
        const TodoSnackbar(
          title: 'Success',
          message: 'Berhasil registrasi akun',
          type: SnackbarType.success,
        );
        return data;
      },
    );
  }

  Future<void> login(LoginBody body) async {
    loginLoading(true);
    try {
      final failureorSuccess = await loginUsecase.call(body);
      await failureorSuccess.fold(
        (error) async {
          loginLoading(false);
          Get.snackbar(
            'Failure',
            'Email atau Password yang anda masukan salah',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return error;
        },
        (data) async {
          await Hive.box(tokenBox).put('token', data.accessToken);
          Hive.box<dynamic>('user_id');
          await Hive.box(userId).put('id', data.id);
          loginLoading(false);
          await Get.offNamed(Routes.home);
        },
      );
    } catch (e) {
      loginLoading(false);
      Get.snackbar(
        'Failure',
        'Email atau Password yang anda masukan salah',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
