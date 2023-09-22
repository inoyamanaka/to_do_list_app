// ignore_for_file: inference_failure_on_function_invocation

import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/auth/domain/entities/login_entity.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';

abstract class LocalVerificationDatasource {
  Future<void> addToken(LoginEntity data);
}

class LocalVerificationDatasourceImpl implements LocalVerificationDatasource {
  final box = Hive.box(tokenBox);
  @override
  Future<void> addToken(LoginEntity data) async {
    await box.add(data.access_token);
    print(box);
  }
}
