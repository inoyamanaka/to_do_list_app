// ignore_for_file: inference_failure_on_function_invocation

import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_list_app/app/app.dart';
import 'package:to_do_list_app/bootstrap.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';
import 'package:to_do_list_app/infrastructure/env/env_config.dart';
import 'package:to_do_list_app/infrastructure/env/flavor.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  tz.initializeTimeZones();

  await Hive.initFlutter();

  Hive..registerAdapter<DataModel>(DataModelAdapter())
  ..registerAdapter<StatisticDataModel>(StatisticDataModelAdapter());

  await Hive.openBox(tokenBox);
  await Hive.openBox(databaseBox);
  await Hive.openBox(activityBox);

  FlavorSettings.development();
  await bootstrap(() => DevicePreview(builder: (context) => const App()));

  ///[console] flavor running
  if (!kReleaseMode) {
    log('🚀 APP FLAVOR NAME      : Development');
    log('🚀 APP API_BASE_URL     : ${FlavorSettings.development().apiBaseUrl}');
  }
}
