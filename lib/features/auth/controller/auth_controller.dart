// ignore_for_file: inference_failure_on_function_invocation

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/data/models/response/register_response.dart';
import 'package:to_do_list_app/features/auth/domain/entities/register_entity.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:to_do_list_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

class AuthController extends GetxController
    with StateMixin<Iterable<RegisterModel>> {
  AuthController(this.registerUsecase, this.loginUsecase);

  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;

  Future<Either<Failure, RegisterEntity>> register(RegisterBody body) async {
    final failureorSuccess = await registerUsecase.call(body);
    failureorSuccess.fold(
      (error) {
        return error;
      },
      (data) async {
        return data;
      },
    );
    throw 'Unexpected error';
  }

  Future<void> login(LoginBody body) async {
    final failureorSuccess = await loginUsecase.call(body);

    failureorSuccess.fold(
      (error) {
        Get.snackbar(
          'Failure',
          'Email atau Password yang anda masukan salah',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return error;
      },
      (data) async {
        await Get.offNamed(Routes.home);
      },
    );
  }
}
